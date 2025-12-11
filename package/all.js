import Tab from 'bootstrap/js/src/tab'

function initAll (options) {
  // Set the options to an empty object by default if no options are passed.
  options = typeof options !== 'undefined' ? options : {}

  // Allow the user to initialise components in only certain sections of the page
  // Defaults to the entire document if nothing is set.
  const scope = typeof options.scope !== 'undefined' ? options.scope : document  

  var triggerTabList = [].slice.call(scope.querySelectorAll('.nav-link'))
  triggerTabList.forEach(function (triggerEl) {
    var tabTrigger = new Tab(triggerEl)
  
    triggerEl.addEventListener('click', function (event) {
      event.preventDefault()
      tabTrigger.show()
    })
  })
}

export {
  initAll,
  Tab
}



