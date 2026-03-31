import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "origemUf", "origemCidade", 
    "destinoUf", "destinoCidade", 
    "precoInput", "feedback"
  ]

  async calcular() {
    const origemUf = this.origemUfTarget.value;
    const origemCidade = this.origemCidadeTarget.value;
    const destinoUf = this.destinoUfTarget.value;
    const destinoCidade = this.destinoCidadeTarget.value;

    if (!origemUf || !origemCidade || !destinoUf || !destinoCidade) return;

    if (this.hasFeedbackTarget) {
      this.feedbackTarget.textContent = "Estimando distância e valor...";
      this.feedbackTarget.className = "text-info fw-bold mb-3";
    }

    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

    try {
      const response = await fetch('/fretes/estimar_preco', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': csrfToken
        },
        body: JSON.stringify({
          origem_uf: origemUf,
          origem_cidade: origemCidade,
          destino_uf: destinoUf,
          destino_cidade: destinoCidade
        })
      });

      const data = await response.json();

      if (data.sucesso) {
        if (this.hasFeedbackTarget) {
          this.feedbackTarget.textContent = `Distância estimada: ${data.distancia_km} km`;
          this.feedbackTarget.className = "text-success fw-bold mb-3";
        }
        
        if (this.hasPrecoInputTarget) {
          this.precoInputTarget.value = data.preco_sugerido.toFixed(2);
        }
      } else {
        if (this.hasFeedbackTarget) {
          this.feedbackTarget.textContent = data.erro;
          this.feedbackTarget.className = "text-danger fw-bold mb-3";
        }
      }
    } catch (error) {
      console.error(error);
      if (this.hasFeedbackTarget) {
        this.feedbackTarget.textContent = "Erro ao calcular frete. Digite o preço manualmente.";
        this.feedbackTarget.className = "text-warning fw-bold mb-3";
      }
    }
  }
}