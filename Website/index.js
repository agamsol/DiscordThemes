window.onload = () => {
    const background = document.getElementsByClassName("background")[0];
    const backgroundOverlay = document.getElementsByClassName("background-overlay")[0];
    let items = [];

    const onscroll = e => {
        const val = `top:${window.scrollY / 2}px;filter:blur(${Math.min(window.scrollY / 100, 20)}px)`;

        background.setAttribute("style", val);
        backgroundOverlay.setAttribute("style", val);

        for (let i = 0; i < items.length; i++) {
            let item = items[i];
            if (item.getBoundingClientRect().top - window.innerHeight + 300 <= 0) {
                item.style.opacity = 1;
            } else {
                item.style.opacity = 0;
            }
        }
    };

    window.addEventListener("scroll", onscroll);

    document.getElementsByClassName("main")[0].onclick = e => {
        if (!e.target.onclick) {
            openTheme();
        }
    };

    const item = (theme, full) => {
        const id = document.getElementsByClassName("item").length;
        return `
            <div id="item-${id}" class="item scroll-into-view" style="${full ? 'height:85%;top:400px' : ''}" onclick="openTheme('${theme.name}', ${full})">
                <span class="label">${theme.name}</span>
                <div class="preview" style="background-image:url(${theme.images[0]})" onclick="window.open('${theme.images[0]}')"></div>
                <div class="desc">${full ? theme.description : ''}</div>
                <div class="download" onclick="window.open('${theme.link}')">DOWNLOAD</div>
            </div>
        `;
    };
    
    fetch("data.json", { "cache": "no-cache" }).then(r => r.json()).then(data => {
        if (window.location.href.indexOf("?") != -1) {
            params = window.location.href.split("?")[1].split("&");
    
            for (let p = 0; p < params.length; p++) {
                if (params[p].split("=")[0] == "theme") {
                    data.themes.forEach(theme => {
                        if (params[p].split("=")[1].toLowerCase().split("%20").join(" ") == theme.name.toLowerCase()) {
                            document.getElementsByClassName("themes")[0].insertAdjacentHTML("beforeEnd", item(theme, true));
                            document.getElementsByClassName("themes")[0].style = "grid-template-columns:1fr;grid-template-rows:1fr";
                            document.getElementsByClassName("header")[0].innerHTML = theme.name;

                            let i = document.getElementsByClassName("item")[0];
                            let v = i.getElementsByClassName("preview")[0];
                            i.classList.add("focused");

                            v.currentImage = 0;

                            v.insertAdjacentHTML("beforeEnd", `
                                <div class="arr prev"></div>
                                <div class="arr next"></div>
                            `);

                            const udv = (p, n) => {
                                v.style.backgroundImage = `url(${theme.images[v.currentImage]})`;

                                if (v.currentImage == 0) {
                                    p.style.opacity = 0;
                                } else {
                                    p.style.opacity = 1;
                                }

                                if (v.currentImage + 1 >= theme.images.length) {
                                    n.style.opacity = 0;
                                } else {
                                    n.style.opacity = 1;
                                }
                            };

                            udv(v.getElementsByClassName("prev")[0], v.getElementsByClassName("next")[0]);

                            v.onclick = e => {
                                if (e.target == v) {
                                    window.open(v.style.backgroundImage.split("url(")[1].split(")")[0]);
                                }
                            };

                            v.getElementsByClassName("prev")[0].onclick = e => {
                                if (v.currentImage > 0) {
                                    v.currentImage--;
                                }
                                
                                udv(v.getElementsByClassName("prev")[0], v.getElementsByClassName("next")[0]);
                            };

                            v.getElementsByClassName("next")[0].onclick = e => {
                                if (v.currentImage + 1 < theme.images.length) {
                                    v.currentImage++;
                                }

                                udv(v.getElementsByClassName("prev")[0], v.getElementsByClassName("next")[0]);
                            };
                        }
                    });
                }
            }
        } else {
            data.themes.forEach(theme => {
                document.getElementsByClassName("themes")[0].insertAdjacentHTML("beforeEnd", item(theme));
            });
        }
    
        items = document.getElementsByClassName("item");
        onscroll();
    });
};

function openTheme(theme, full) {
    if (full) {
        return;
    }

    if (theme != undefined) {
        window.location.href += "?theme=" + theme;
    } else if (window.location.href.includes("?")) {
        window.location.href = window.location.href.split("?")[0];
    }
}