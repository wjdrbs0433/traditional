////////////////////////////////////////////////////////////////////////////////////////////////
/* 메인페이지 리스트 목록 숨기기, 보이기 */
////////////////////////////////////////////////////////////////////////////////////////////////
function genreClick() {
	$("#genre").show();
	$("#situation").hide();
	$("#mood").hide();
	$("#a").hide();
}

function situationClick() {
	$("#genre").hide();
	$("#situation").show();
	$("#mood").hide();
	$("#a").hide();
}


function moodClick() {
	$("#genre").hide();
	$("#situation").hide();
	$("#mood").show();
	$("#a").hide();
}

function aClick() {
	$("#genre").hide();
	$("#situation").hide();
	$("#mood").hide();
	$("#a").show();
}

////////////////////////////////////////////////////////////////////////////////////////////////
/* 사이드 바 */
////////////////////////////////////////////////////////////////////////////////////////////////

/* EXPANDER MENU */
const showMenu = (toggleId, navbarId, bodyId) => {
    const toggle = document.getElementById(toggleId),
    navbar = document.getElementById(navbarId),
    bodypadding = document.getElementById(bodyId)

    if( toggle && navbar ) {
        toggle.addEventListener('click', ()=>{
            navbar.classList.toggle('expander');

            bodypadding.classList.toggle('body-pd')
        })
    }
}

showMenu('nav-toggle', 'navbar', 'body-pd')

/* LINK ACTIVE */
const linkColor = document.querySelectorAll('.nav__link')
function colorLink() {
    linkColor.forEach(l=> l.classList.remove('active'))
    this.classList.add('active')
}
linkColor.forEach(l=> l.addEventListener('click', colorLink))

/* COLLAPSE MENU */
const linkCollapse = document.getElementsByClassName('collapse__link')
var i

for(i=0;i<linkCollapse.length;i++) {
    linkCollapse[i].addEventListener('click', function(){
        const collapseMenu = this.nextElementSibling
        collapseMenu.classList.toggle('showCollapse')

        const rotate = collapseMenu.previousElementSibling
        rotate.classList.toggle('rotate')
    });
}


////////////////////////////////////////////////////////////////////////////////////////////////
/* choiceCategory.jsp */
////////////////////////////////////////////////////////////////////////////////////////////////

const gd = document.getElementById('genreDiv');
const sd = document.getElementById('situationDiv');
const md = document.getElementById('moodDiv');

function genreShow() {
	gd.style.display = 'block';
	sd.style.display = 'none';
	md.style.display = 'none';
}

function situationShow() {
	gd.style.display = 'none';
	sd.style.display = 'block';
	md.style.display = 'none';
}

function moodShow() {
	gd.style.display = 'none';
	sd.style.display = 'none';
	md.style.display = 'block';
}
