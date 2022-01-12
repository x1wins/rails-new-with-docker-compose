import autocomplete from 'autocompleter';
import handleErrors from './handle_error';

document.addEventListener("turbolinks:load", function() {
    var input = document.getElementById("q");
    var spinner = document.getElementById("autocomplete-spinner-addon");
    var button = document.getElementById("autocomplete-button-addon");
    stopAutocompleteSpinner(spinner, button);
    autocomplete({
        input: input,
        fetch: function(text, update) {
            if(text.length < 2){
                return;
            }
            text = text.toLowerCase();
            startAutocompleteSpinner(spinner, button);
            fetch("/shippings/autocomplete?q="+text)
                .then(handleErrors)
                .then(response => response.json())
                .then(json => {
                    stopAutocompleteSpinner(spinner, button);
                    update(json);
                    console.log("ok")
                    console.log(json)
                }).catch(error => {
                    stopAutocompleteSpinner(spinner, button);
                    console.log(error)
                });
        },
        onSelect: function(item) {
            input.value = item.label;
        }
    });
});

function startAutocompleteSpinner(spinner, button){
    spinner.style.display = "block"
    button.style.display = "none"
}
function stopAutocompleteSpinner(spinner, button){
    spinner.style.display = "none"
    button.style.display = "block"
}