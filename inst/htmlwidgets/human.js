HTMLWidgets.widget({
  name: "human",

  type: "output",

  factory: function (el) {
    return {
      renderValue: function (x) {
        el.innerHTML = x.svg_text;
        el.style.border = "1px solid #ccc";
        el.style.display = "inline-block";
        el.style.verticalAlign = "top";

        x.shown.forEach(function (id_to_show) {
          const shownPart = el.querySelector(`#${id_to_show}`);
          if (shownPart) {
            shownPart.style.fill = "black";
            shownPart.style.stroke = "black";
            shownPart.addEventListener('click', function() {
              console.log('Clicked element:', id_to_show);
              // If using with Shiny, you can set an input value
              if (window.Shiny) {
                  Shiny.setInputValue('clicked_body_part', id_to_show);
              }
            })
          }
        });

        x.highlighted.forEach(function (id_to_highlight) {
          const highlightPart = el.querySelector(`#${id_to_highlight}`);
          if (highlightPart) {
            highlightPart.style.fill = "yellow";
            highlightPart.style.stroke = "yellow";
          }
        });

        x.selected.forEach(function (id_to_select) {
          const selectedPart = el.querySelector(`#${id_to_select}`);
          if (selectedPart) {
            selectedPart.setAttribute('data-selected', 'true');
          }
        });
      },

      resize: function (width, height) {
        // TODO: code to re-render the widget with a new size
      },
    };
  },
});
