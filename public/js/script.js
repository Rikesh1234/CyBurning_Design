// let lastScrollY = window.scrollY;
// const navbar = document.querySelector('.navbar');
// let isNavbarVisible = true;

// window.addEventListener('scroll', () => {
//   const currentScrollY = window.scrollY;
  
//   // If the scroll position is more than 80px
//   if (currentScrollY > 80) {
//     if (currentScrollY > lastScrollY && isNavbarVisible) {
//       // Scrolling down, hide navbar
//       navbar.style.transform = 'translateY(-100%)';
//       isNavbarVisible = false;
//     } else if (currentScrollY < lastScrollY && !isNavbarVisible) {
//       // Scrolling up, show navbar
//       navbar.style.transform = 'translateY(0)';
//       isNavbarVisible = true;
//     }
//     navbar.classList.add('active');
//   } else {
//     navbar.style.transform = 'translateY(0)';
//     navbar.classList.remove('active');
//   }

//   lastScrollY = currentScrollY;
// });

let lastScrollY = window.scrollY;
const navbar = document.querySelector('.navbar');
const Mobilenavbar = document.querySelector('.mobile-navigation');

window.addEventListener('scroll', () => {
  const currentScrollY = window.scrollY;

  // If the scroll position is more than 80px
  if (currentScrollY > 80) {
    navbar.classList.add('active'); // Add 'active' class to navbar when scrolling down
    Mobilenavbar.classList.add('active');
  } else {
    navbar.classList.remove('active'); // Remove 'active' class when scrolling back to the top
    Mobilenavbar.classList.remove('active');
  }

  lastScrollY = currentScrollY;
});




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

document.addEventListener("DOMContentLoaded", function() {
  // Get all the tab buttons and panels
  const tabAboutButtons = document.querySelectorAll('.tab-about-btn');
  const tabAboutPanels = document.querySelectorAll('.tab-about-panel');

  // Add click event to each button
  tabAboutButtons.forEach(button => {
    button.addEventListener('click', () => {
      // Remove the active class from all buttons and panels
      tabAboutButtons.forEach(btn => btn.classList.remove('active'));
      tabAboutPanels.forEach(panel => panel.classList.remove('active'));

      // Add the active class to the clicked button and the corresponding panel
      button.classList.add('active');
      const targetPanel = document.getElementById(button.getAttribute('data-target'));
      if (targetPanel) {
        targetPanel.classList.add('active');
      }
    });
  });
});
document.addEventListener('DOMContentLoaded', () => {
  const tabProjectButtons = document.querySelectorAll('.tab-project-btn');
  const tabProjectPanels = document.querySelectorAll('.tab-project-panel');
  const allPanel = document.getElementById('all');

  // Function to populate the "All" tab dynamically
  const populateAllPanel = () => {
    allPanel.innerHTML = '<div class="row"></div>'; // Clear and set up a single row
    const allRow = allPanel.querySelector('.row');

    tabProjectPanels.forEach(panel => {
      if (panel.id !== 'all') {
        const projectCards = panel.querySelectorAll('.project-card');
        projectCards.forEach(card => {
          // Clone each project card and append it to the "All" row
          const cardClone = card.parentElement.cloneNode(true);
          allRow.appendChild(cardClone);
        });
      }
    });
  };

  // Populate "All" tab on page load
  populateAllPanel();

  // Show only the "All" tab on page load
  tabProjectPanels.forEach(panel => {
    panel.classList.remove('active');
  });
  allPanel.classList.add('active');

  // Add click event listeners for tab buttons
  tabProjectButtons.forEach(button => {
    button.addEventListener('click', () => {
      // Handle active button
      tabProjectButtons.forEach(btn => btn.classList.remove('active'));
      button.classList.add('active');

      // Handle active panel with animation
      const targetId = button.getAttribute('data-target');

      if (targetId === 'all') {
        populateAllPanel(); // Repopulate "All" tab content when selected
      }

      tabProjectPanels.forEach(panel => {
        if (panel.id === targetId) {
          panel.classList.add('active');
        } else {
          panel.classList.remove('active');
        }
      });
    });
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



function animateCounter(counter) {
  const target = +counter.getAttribute('data-target');
  const countElement = counter.querySelector('.count');
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
const counters = document.querySelectorAll('.counter'); // Select all counter elements
const observer = new IntersectionObserver((entries, observer) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      animateCounter(entry.target);
      observer.unobserve(entry.target); // Stop observing after it's animated
    }
  });
}, { threshold: 0.5 }); // Trigger when 50% of the element is visible

// Start observing all counter elements
counters.forEach(counter => {
  observer.observe(counter);
});

if (AOS != "null") {
  // Initialize AOS (Animate on Scroll)
  AOS.init({
    duration: 1000, // Animation duration
    once: true,     // Only animate once
    offset: 100     // Offset for when the animation triggers
  });

  // Apply a delay to each AOS element
  const aosElements = document.querySelectorAll('[data-aos]');
  aosElements.forEach((element, index) => {
    const delay = index * 100;  // Increase the delay by 100ms for each element
    element.setAttribute('data-aos-delay', delay);  // Set delay dynamically
  });
}
