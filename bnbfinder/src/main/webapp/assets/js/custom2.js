//Salvataggio dati form e reimpostazione al caricamento della pagina

/*function saveFormData() {
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

});*/

// Funzione per salvare le scelte dell'utente
function saveForm() {

  const formValues = {
    selectedLocation: document.getElementById("chooseLocation").value,
    selectedPrice: document.getElementById("choosePrice").value,
    selectedCity: document.getElementById("chooseCity").value,
    // Salvare lo stato dei checkbox
    vistaMare: document.getElementById("inlineCheckbox1").checked,
    ariaCondizionata: document.getElementById("inlineCheckbox2").checked,
    wifi: document.getElementById("inlineCheckbox3").checked,
    tv: document.getElementById("inlineCheckbox4").checked,
    lavatrice: document.getElementById("inlineCheckbox5").checked,
    cucina: document.getElementById("inlineCheckbox6").checked,
    asciugacapelli: document.getElementById("inlineCheckbox7").checked,
    frigorifero: document.getElementById("inlineCheckbox8").checked,
    palestra: document.getElementById("inlineCheckbox9").checked,
    accessoSpiaggia: document.getElementById("inlineCheckbox10").checked,
    parcheggioGratuito: document.getElementById("inlineCheckbox11").checked,
    piscina: document.getElementById("inlineCheckbox12").checked
    // Aggiungi altri valori da salvare, se necessario
  };
  
  // Salvataggio in localStorage
  localStorage.setItem('formValues', JSON.stringify(formValues));
}

function loadForm() {
  // Recupera i valori salvati da localStorage
  const savedFormValues = JSON.parse(localStorage.getItem('formValues'));

  if (savedFormValues) {
    // Ripristina i valori nei campi del modulo
    document.getElementById("chooseLocation").value = savedFormValues.selectedLocation;
    document.getElementById("choosePrice").value = savedFormValues.selectedPrice;
    document.getElementById("chooseCity").value = savedFormValues.selectedCity;
    document.getElementById("inlineCheckbox1").checked = savedFormValues.vistaMare;
    document.getElementById("inlineCheckbox2").checked = savedFormValues.ariaCondizionata;
    document.getElementById("inlineCheckbox3").checked = savedFormValues.wifi;
    document.getElementById("inlineCheckbox4").checked = savedFormValues.tv;
    document.getElementById("inlineCheckbox5").checked = savedFormValues.lavatrice;
    document.getElementById("inlineCheckbox6").checked = savedFormValues.cucina;
    document.getElementById("inlineCheckbox7").checked = savedFormValues.asciugacapelli;
    document.getElementById("inlineCheckbox8").checked = savedFormValues.frigorifero;
    document.getElementById("inlineCheckbox9").checked = savedFormValues.palestra;
    document.getElementById("inlineCheckbox10").checked = savedFormValues.accessoSpiaggia;
    document.getElementById("inlineCheckbox11").checked = savedFormValues.parcheggioGratuito;
    document.getElementById("inlineCheckbox12").checked = savedFormValues.piscina;
    
  }
}

// Esegui la funzione di caricamento dei dati al caricamento della pagina
window.onload = function() {
  loadForm();
  
};

// Funzione per reimpostare il modulo
function resetForm() {
  // Reimposta il modulo alle impostazioni predefinite, inclusi gli stati dei checkbox
  
  // Esempio di reimpostazione dei valori del modulo
  document.getElementById("chooseLocation").value = "";
  document.getElementById("choosePrice").value = "";
  document.getElementById("chooseCity").value = "";
  // Reimposta altri elementi del modulo, se necessario
  
  // Reimposta lo stato dei checkbox
  document.getElementById("inlineCheckbox1").checked = false;
  document.getElementById("inlineCheckbox2").checked = false;
  document.getElementById("inlineCheckbox3").checked = false;
  document.getElementById("inlineCheckbox4").checked = false;
  document.getElementById("inlineCheckbox5").checked = false;
  document.getElementById("inlineCheckbox6").checked = false;
  document.getElementById("inlineCheckbox7").checked = false;
  document.getElementById("inlineCheckbox8").checked = false;
  document.getElementById("inlineCheckbox9").checked = false;
  document.getElementById("inlineCheckbox10").checked = false;
  document.getElementById("inlineCheckbox11").checked = false;
  document.getElementById("inlineCheckbox12").checked = false;
  // Reimposta altri checkbox, se necessario
  
  // Cancella i dati salvati
  localStorage.removeItem('formValues');
  
  // Ricarica la pagina
  location.reload();
}