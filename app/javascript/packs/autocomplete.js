import autocomplete from 'autocompleter';

document.addEventListener("turbolinks:load", function() {
    console.log("turbolinks:load");
    var countries = [
        { label: 'United Kingdom', value: 'UK' },
        { label: 'United States', value: 'US' }
    ];

    var input = document.getElementById("country");

    autocomplete({
        input: input,
        fetch: function(text, update) {
            console.log('autocom');
            text = text.toLowerCase();
            // you can also use AJAX requests instead of preloaded data
            var suggestions = countries.filter(n => n.label.toLowerCase().startsWith(text))
            update(suggestions);
        },
        onSelect: function(item) {
            input.value = item.label;
        }
    });
});