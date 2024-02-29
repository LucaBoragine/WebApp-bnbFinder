//Salvataggio dati form e reimpostazione al caricamento della pagina

function saveFormData() {
  var formData = {
    citta: document.getElementsByName("citta")[0].value,
    prezzo: document.getElementsByName("prezzo_max")[0].value
  };
  localStorage.setItem("formData", JSON.stringify(formData));
}

document.addEventListener("DOMContentLoaded", function() {
  var savedFormData = localStorage.getItem("formData");
  if (savedFormData) {
    savedFormData = JSON.parse(savedFormData);
    document.getElementsByName("citta")[0].value = savedFormData.citta;
    document.getElementsByName("prezzo_max")[0].value = savedFormData.prezzo;
  }
  
    if (window.location.href === "http://localhost:8080/") {
    	document.getElementsByName("citta")[0].value = "Citta'";
    	document.getElementsByName("prezzo_max")[0].value = "Prezzo Massimo";
  }
});