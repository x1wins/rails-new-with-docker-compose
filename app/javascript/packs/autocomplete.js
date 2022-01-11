import autocomplete from 'autocompleter';

document.addEventListener("turbolinks:load", function() {
    var input = document.getElementById("q");
    autocomplete({
        input: input,
        fetch: function(text, update) {
            text = text.toLowerCase();
            // you can also use AJAX requests instead of preloaded data
            fetch("/shippings/autocomplete?q="+text)
                .then((data) => data.json())
                .then((json) => {
                    console.log(json)
                    update(json);
                });
        },
        onSelect: function(item) {
            input.value = item.label;
        }
    });
});