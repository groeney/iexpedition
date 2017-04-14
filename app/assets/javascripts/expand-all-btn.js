$(document).ready(function () {
    var openAllBtn = $('h5.open-all'),
        closeAllBtn = $('h5.close-all'),
        allTabs = $('ul.expedition-advantages > li');

    function openAll() {
        allTabs.addClass('active');
    }

    function closeAll() {
        allTabs.removeClass('active');
    }

    openAllBtn.on('click', openAll);
    closeAllBtn.on('click', closeAll);
});