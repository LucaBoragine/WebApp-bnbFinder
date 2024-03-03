/**
 * logica di inserimento data form prenotazione
 */

     
var today = new Date().toISOString().split('T')[0];
document.getElementsByName("inizio")[0].setAttribute('min', today);
document.getElementsByName("fine")[0].setAttribute('min', today);

document.getElementsByName("inizio")[0].addEventListener("change", function() { 
	var inizio = this.value;
	var fine = document.getElementsByName("fine")[0].value;
	if(inizio > fine || fine == ''){ 
		document.getElementsByName("fine")[0].setAttribute('min', inizio);
		document.getElementsByName("fine")[0].value = inizio;
	}
});