import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["uf", "cidade"]

  async carregarCidades() {
    const ufSigla = this.ufTarget.value;
    
    this.cidadeTarget.innerHTML = '<option value="">Carregando...</option>';
    this.cidadeTarget.disabled = true;

    if (!ufSigla) {
      this.cidadeTarget.innerHTML = '<option value="">Selecione um Estado primeiro</option>';
      return;
    }

    try {
      const response = await fetch(`https://servicodados.ibge.gov.br/api/v1/localidades/estados/${ufSigla}/municipios?orderBy=nome`);
      const cidades = await response.json();

      this.cidadeTarget.innerHTML = '<option value="">Selecione a Cidade</option>';
      
      const fragment = document.createDocumentFragment();
      cidades.forEach(cidade => {
        const option = document.createElement('option');
        option.value = cidade.nome;
        option.textContent = cidade.nome;
        fragment.appendChild(option);
      });
      
      this.cidadeTarget.appendChild(fragment);
      this.cidadeTarget.disabled = false;

    } catch (error) {
      console.error("Erro ao carregar cidades:", error);
      this.cidadeTarget.innerHTML = '<option value="">Erro ao carregar cidades</option>';
    }
  }
}