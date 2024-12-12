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

        Object.keys(x.organs).forEach(function (organ) {
          const shownPart = el.querySelector(`#${organ}`);
          const organObject = x.organs[organ];

          if (organObject.show) {
            shownPart.style.fill = "black";
            shownPart.style.stroke = "black";
            shownPart.style.cursor = "pointer";

            shownPart.addEventListener("click", function () {
              console.log("Clicked element:", organ);
              if (window.Shiny) {
                Shiny.setInputValue("clicked_body_part", organ);
              }
            });

            if (organObject.selected) {
              shownPart.setAttribute("data-selected", "true");
              shownPart.style.fill = "yellow";
              shownPart.style.stroke = "yellow";
            }

            if (organObject.hovertext) {
              shownPart.addEventListener("mouseenter", function () {
                shownPart.style.title = organObject.hovertext;
              });
            }
          }
        });
      },

      resize: function (width, height) {
        // TODO: code to re-render the widget with a new size
      },
    };
  },
});
