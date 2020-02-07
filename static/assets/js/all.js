function show_example(select) {
    let value = select.value;

	// remove the class visible from the element's classes 
    let classful = document.querySelector('.code-examples .example.visible');
    if (classful) {
        classful.classList.remove('visible');
    }

	// make selected element visible 
    document
        .querySelector(`.code-examples .example[data-example="${value}"]`)
        .classList
        .add('visible');
};

function show_random_example(select) {
    let options = select.querySelectorAll('option');
    let index = Math.floor(Math.random() * options.length);
    options[index].selected = true;
    show_example(select);
};

document.addEventListener('DOMContentLoaded', function() {
    let select_example = document.querySelector('.code-examples > select');

    if ( select_example ) {
        select_example.addEventListener('change', function(event) {
            show_example(event.target);
        });

        show_random_example(select_example);
    }
});

/*
Light/dark theme toggler
*/

/**
 * Summary: function that adds or removes the attribute 'data-theme' depending if
 * the switch is 'on' or 'off'.
 *
 * Description: initTheme is a function that uses localStorage from JavaScript DOM,
 * to store the value of the HTML switch. If the switch was already switched to
 * 'on' it will set an HTML attribute to the body named: 'data-theme' to a 'dark'
 * value. If it is the first time opening the page, or if the switch was off the
 * 'data-theme' attribute will not be set.
 * @return {void}
 */
function initTheme() {
  const darkThemeSelected =
    localStorage.getItem('light-dark-switch') !== null &&
    localStorage.getItem('light-darkh-switch') === 'light';
    darkSwitch.checked = darkThemeSelected;
    darkThemeSelected ? document.body.setAttribute('data-theme', 'light') :
    document.body.removeAttribute('data-theme');
}

/**
 * Summary: resetTheme checks if the switch is 'on' or 'off' and if it is toggled
 * on it will set the HTML attribute 'data-theme' to dark so the dark-theme CSS is
 * applied.
 * @return {void}
 */
function resetTheme() {
  if (darkSwitch.checked) {
    document.body.setAttribute('data-theme', 'light');
    localStorage.setItem('light-dark-switch', 'light');
  } else {
    document.body.removeAttribute('data-theme');
    localStorage.removeItem('light-dark-switch');
  }
}

const darkSwitch = document.getElementById('light-dark-switch');
window.addEventListener('load', () => {
  if (darkSwitch) {
    initTheme();
    darkSwitch.addEventListener('change', () => {
      resetTheme();
    });
  }
});

