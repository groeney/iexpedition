$(document).ready(function() {
  $('.tabs').each(function(){
      var tabs = $(this);
      tabs.after('<ul class="tabs-content">');
      tabs.find('li').each(function(){
          var currentTab      = $(this),
              tabContent      = currentTab.find('.tab__content').wrap('<li></li>').parent(),
              tabContentClone = tabContent.clone(true,true);
          tabContent.remove();
          currentTab.closest('.tabs-container').find('.tabs-content').append(tabContentClone);
      });
  });

  $('.tabs li').on('click', function(){
      var clickedTab    = $(this),
          tabContainer  = clickedTab.closest('.tabs-container'),
          activeIndex   = (clickedTab.index()*1)+(1),
          activeContent = tabContainer.find('> .tabs-content > li:nth-of-type('+activeIndex+')'),
          iframe, radial;

      tabContainer.find('> .tabs > li').removeClass('active');
      tabContainer.find('> .tabs-content > li').removeClass('active');

      clickedTab.addClass('active');
      activeContent.addClass('active');


      // If there is an <iframe> element in the tab, reload its content when the tab is made active.
      iframe = activeContent.find('iframe');
      if(iframe.length){
          iframe.attr('src', iframe.attr('src'));
      }
  });

  $('.tabs li.active').trigger('click');
});