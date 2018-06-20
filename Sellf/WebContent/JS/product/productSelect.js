var tapBefore;
window.ready = function()
{
	tapBefore = document.getElementById("firstLi");
}
function changeTab(tabInfo)
{    
    tabInfo.classList.add('active');
    tapBefore.classList.remove('active');
    tapBefore = tabInfo;
}