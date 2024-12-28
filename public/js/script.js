setTimeout(function () {
    const preloader = document.getElementById('preloader');
    if (preloader) {
      preloader.style.opacity = '0'; // Add fade-out effect
      setTimeout(() => {
        preloader.style.display = 'none'; // Remove it completely after fade-out
      }, 500); // Matches the fade-out transition duration
    }
  }, 3000); // Time in milliseconds (3 seconds)

const shareIcon = document.querySelector('.share-icon');
const socialNav = document.querySelector('.social-nav');
const closeIcon = document.querySelector('.social-nav-close');

shareIcon.addEventListener('click', (e) => {
    e.stopPropagation(); // Prevents propagation of the event
    socialNav.classList.add('active');
  });

  // Remove active class when the close icon is clicked
  closeIcon.addEventListener('click', (e) => {
    e.stopPropagation(); // Prevents propagation to parent
    socialNav.classList.remove('active');
  });

  // Close socialNav when clicking anywhere else on the page
  document.addEventListener('click', () => {
    socialNav.classList.remove('active');
  });

  // Open the mobile menu
const menuToggle = document.getElementById('menuToggle');
const mobileMenu = document.getElementById('mobileMenu');
const desktopMenu = document.querySelector('.desktopMenu');
const closeMenu = document.getElementById('closeMenu');
const navMobile = document.querySelector('.nav-logo-mobile');


menuToggle.addEventListener('click', () => {
    mobileMenu.classList.add('open');
    navMobile.style.opacity = "0";
});

desktopMenu.addEventListener('click', () => {
    mobileMenu.classList.add('open');
    navMobile.style.opacity = "0";
});

closeMenu.addEventListener('click', () => {
    mobileMenu.classList.remove('open');
    navMobile.style.opacity = "1";
});

// Toggle Submenu
const submenuItems = document.querySelectorAll('.has-submenu > a, .has-submenu-child > a');

submenuItems.forEach(item => {
    item.addEventListener('click', (e) => {
        e.preventDefault();  // Prevent page reload
        const parent = item.parentElement;

        // Toggle 'open' class to show/hide the submenu
        parent.classList.toggle('open');
        
        // Toggle "+" to "-" for parent or submenu
        const span = item.querySelector('span');
        if (parent.classList.contains('open')) {
            span.textContent = '-';  // Change "+" to "-"
        } else {
            span.textContent = '+';  // Change back to "+"
        }
    });
});

// Get all the tab buttons and panels
const tabButtons = document.querySelectorAll('.tab-btn');
const tabPanels = document.querySelectorAll('.tab-panel');

// Add click event to each button
tabButtons.forEach(button => {
    button.addEventListener('click', () => {
        // Remove the active class from all buttons and panels
        tabButtons.forEach(btn => btn.classList.remove('active'));
        tabPanels.forEach(panel => panel.classList.remove('active'));

        // Add the active class to the clicked button and the corresponding panel
        button.classList.add('active');
        const targetPanel = document.getElementById(button.getAttribute('data-target'));
        targetPanel.classList.add('active');
    });
});

$(document).ready(function () {
  $(".slider-section").owlCarousel({
    items: 1,
    loop: true,
    autoplay: true,
    autoplayTimeout: 5000,
    autoplayHoverPause: true,
    dots: false, // Disable dots
    nav: true, // Enable navigation
    navText: [
      '<i class="fa-solid fa-angle-left"></i>',
      '<i class="fa-solid fa-angle-right"></i>',
    ],
    animateOut: 'fadeOut', // Add this line for fade out transition
    animateIn: 'fadeIn', // Add this line for fade in transition
  });

  // Handle animation on slide change
  $(".owl-carousel").on("changed.owl.carousel", function () {
    // Remove active class from all text
    $(".slider-content h1").removeClass("active");
    $(".slider-content p").removeClass("active");
    $(".slider-btn").removeClass("active");

    // Add active class to current slide's content
    setTimeout(() => {
      $(".slider-content h1").addClass("active");
      $(".slider-content p").addClass("active");
      $(".slider-btn").addClass("active");
    }, 500); // Delay to sync with slide transition
  });

  // Add active class to the first slide's content initially
  $(".slider-content h1").addClass("active");
  $(".slider-content p").addClass("active");
  $(".slider-btn").addClass("active");
});

particlesJS( 'particles-js', {
  "particles":     {
    "number":      {
      "value":   100,
      "density": {
        "enable":     true,
        "value_area": 300
      }
    },
    "color":       {
      "value": "#ffffff"
    },
    "shape":       {
      "type":    "circle",
      "stroke":  {
        "width": 0,
        "color": "#000000"
      },
      "polygon": {
        "nb_sides": 5
      },
      "image":   {
        "src":    "img/github.svg",
        "width":  100,
        "height": 100
      }
    },
    "opacity":     {
      "value":  0.5,
      "random": false,
      "anim":   {
        "enable":      false,
        "speed":       1,
        "opacity_min": 0.1,
        "sync":        false
      }
    },
    "size":        {
      "value":  5,
      "random": true,
      "anim":   {
        "enable":   false,
        "speed":    40,
        "size_min": 0.1,
        "sync":     false
      }
    },
    "line_linked": {
      "enable":   true,
      "distance": 150,
      "color":    "#ffffff",
      "opacity":  0.4,
      "width":    1
    },
    "move":        {
      "enable":    true,
      "speed":     6,
      "direction": "none",
      "random":    true,
      "straight":  false,
      "out_mode":  "out",
      "attract":   {
        "enable":  false,
        "rotateX": 600,
        "rotateY": 1200
      }
    }
  },
  "interactivity": {
    "detect_on": "canvas",
    "events":    {
      "onhover": {
        "enable": true,
        "mode":   "grab"
      },
      "onclick": {
        "enable": true,
        "mode":   "push"
      },
      "resize":  true
    },
    "modes":     {
      "grab":    {
        "distance":    300,
        "line_linked": {
          "opacity": 1
        }
      },
      "bubble":  {
        "distance": 400,
        "size":     40,
        "duration": 2,
        "opacity":  8,
        "speed":    3
      },
      "repulse": {
        "distance": 200
      },
      "push":    {
        "particles_nb": 4
      },
      "remove":  {
        "particles_nb": 2
      }
    }
  },
  "retina_detect": true,
  "config_demo":   {
    "hide_card":           false,
    "background_color":    "#000",
    "background_image":    "",
    "background_position": "50% 50%",
    "background_repeat":   "no-repeat",
    "background_size":     "cover"
  }
} );

function animateCounter(counter) {
  const target = +counter.getAttribute('data-target');
  const countElement = counter.querySelector('#count');
  let currentCount = 0;
  
  const interval = setInterval(() => {
    currentCount++;
    countElement.textContent = currentCount;
    
    if (currentCount === target) {
      clearInterval(interval); // Stop when the counter reaches the target
    }
  }, 100); // 100ms interval for smooth counting
}

// Intersection Observer to detect when the counter is in the viewport
const counterElement = document.getElementById('counter');
const observer = new IntersectionObserver((entries, observer) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      animateCounter(entry.target);
      observer.unobserve(entry.target); // Stop observing after it's animated
    }
  });
}, { threshold: 0.5 }); // Trigger when 50% of the element is visible

// Start observing the counter element
observer.observe(counterElement);
