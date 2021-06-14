const toggleArrow = (icon) => {
    const menu1 = document.getElementById("menuDetail1");
    const menu2 = document.getElementById("menuDetail2");
    const menu3 = document.getElementById("menuDetail3");
    const menus = [menu1, menu2, menu3];
    const menusStr = ["menu1", "menu2", "menu3"];

    if (icon.classList.contains("arrowOpen")) {
        icon.classList.remove("arrowOpen");
        for (let i = 0; i < menus.length; i++) {
            if (icon.id == menusStr[i]) {
                menus[i].classList.add("menuDisplayNone");
            }
        }
    } else {
        icon.classList.add("arrowOpen");
        for (let i = 0; i < menus.length; i++) {
            if (icon.id == menusStr[i]) {
                menus[i].classList.remove("menuDisplayNone");
            }
        }
    }
}