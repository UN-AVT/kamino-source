(function() {

queue()
    .defer(d3.csv, "assets/data.csv")
    .await(ready);

var rh = 20;
var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
var breakpoints = [180, 300, 460, 600, 720, 945, 1045, 1200, 1600];
var currentBreakPoint = -1;
var width = 940;
var _data = [];
var margin = {"left": 110, "top": 100};
var tooltip = d3.select("#g-d3js-investchina").append("div").attr("class", "tt").style("position", "absolute").style("width", "160px").style("display", "none").style("z-index", 100);//.style("top", 200+"px").style("left", 200+"px").style("width", "200px");
tooltip.append("div").attr("class", "tooltip-pointer tooltip-pointer-up").style("background", "url(assets/pointer-up-border.png)").style("width", "20px").style("height", "10px").style("position", "absolute").style("left", "70px").style("display", "none");
tooltip.append("div").attr("class", "tooltip-inside").style("min-height", "20px").style("background-color", "#FFF").style("box-shadow", "0px 0px 2px #888888").style("border-radius", "2px").style("padding", "5px").style("margin", "10px -5px 0 -5px").style("font-family", "\"PT Sans\", sans-serif").style("text-align", "center");
tooltip.append("div").attr("class", "tooltip-pointer tooltip-pointer-down").style("background", "url(assets/pointer-down-border.png)").style("width", "20px").style("height", "10px").style("position", "absolute").style("left", "70px");
var legendContainer = d3.select("#g-d3js-investchina").append("div").attr("id", "container-legend").attr("class", "container").style("max-width", "80%").style("margin-left", "auto").style("margin-right", "auto").style("margin-bottom", "30px");
var height = 133 * rh + margin.top;
var notesContainer = d3.select("#g-d3js-investchina").append("div").attr("id", "container-notes").style("position", "absolute");
var container = d3.select("#g-d3js-investchina").append("svg").attr("width", width+40).attr("height", height).style("position", "");
var defs = container.append("defs").append("clipPath").attr("id", "cut-off-bottom").append("rect").attr("x", -500).attr("y", -1000).attr("width", 1000).attr("height", 1000);
var xScaleContainer = container.append("g").attr("id", "container-xscale").attr("class", "container").attr("transform", "translate("+margin.left+",0)");
var yScaleContainer = container.append("g").attr("id", "container-yscale").attr("class", "container").attr("transform", "translate(0,"+margin.top+")");
var mainContainer = container.append("g").attr("id", "container-main").attr("class", "container").attr("transform", "translate("+margin.left+","+margin.top+")");
var startDate = new Date(2004,10,1);
var endDate = new Date(2014,10,1);
var xDateScale = d3.time.scale().domain([startDate, endDate]).range([0,width-margin.left]);
var countries = [];
var sectors = ["Agriculture", "Technology", "Finance", "Energy", "Transport", "Metals", "Real estate", "Other"];
var colours = ["#59521C", "#E5BF7F", "#D01000", "#F98222", "#57AFA3", "#505EA7", "#DA7664", "#362410"];
var checkingSize = false;
var gCountries = gPoints = gYears = divNotes = null;

var notes = [{"note":"Chinalco invested US$12.8 billion in Rio Tinto, an Australian company in the metals sector (aluminium)", "pos":"2006,9,Australia", "width": 1.6},
{"note":"China's largest investment: CNOOC ploughed $15.1 billion into oil and gas company Nexen", "pos": "2012,2,Canada", "width": 1.5},
{"note":"Chinese investments rose over 50 percent in the US from 2012, hitting a record high of over US$14 billion in 2014", "pos": "2007,0,USA", "width": 2}];

function ready (err, data) {
    _data = data;
    numCols = ["year", "quantity"];
    _data.forEach(function(d){
        for (var i=0; i<numCols.length; i++) {
            var newVal = +d[numCols[i]];
            if (!isNaN(newVal)) d[numCols[i]] = newVal;
            else d[numCols[i]] = null;
        }
        if (countries.indexOf(d.country) < 0) countries.push(d.country);
        d.mo = months.indexOf(d.month);
        d.dat = new Date(d.year, d.mo, 1);
    });
    _data.sort(function(a,b) {
        return b.quantity - a.quantity;
    });
    legendContainer.append("div").style("width", "100%").style("font-size", "14px").html("<strong>Industries:</strong> China's worldwide investments and contracts by sector");
    gLegends = legendContainer.selectAll("div.legend-item")
        .data(colours);
    gLegends
        .enter()
        .append("div")
        .attr("class", "legend-item")
        .style("display", "inline-block")
        .style("width", "70px");
    gLegends
        .append("svg")
        .attr("width", 60)
        .attr("height", 40)
        .style("text-align", "center")
        .append("circle")
        .attr("r", 20)
        .attr("cx", 30)
        .attr("cy", 40)
        //.attr("clip-path", "url(#cut-off-bottom)")
        .attr("fill", function(d) { return d; })
        .attr("opacity", .8);
    gLegends
        .append("div")
        .style("font-size", "12px")
        .text(function(d,i){return sectors[i];});
    legendContainer.append("div").style("width", "100%").style("font-size", "14px").style("margin-top", "20px").html("<strong>Money deals:</strong> in billions of US dollars (transactions from US$100 million)");
    moneySvg = legendContainer
        .append("svg")
        .attr("width", 140)
        .attr("height", 90)
        .style("text-align", "center");
    gMoneys = moneySvg.selectAll("circle")
        .data([100,1000,5000,10000]);
    gMoneys
        .enter()
        .append("circle")
        .attr("stroke", "#333")
        .attr("fill", "transparent")
        .attr("r", function(d) { return Math.sqrt(d / Math.PI); })
        .attr("cx", function(d) { return 10 + Math.sqrt(d / Math.PI); })
        .attr("cy", 70);
    moneySvg
        .append("line")
        .attr("x1", 0)
        .attr("x2", 140)
        .attr("y1", 70)
        .attr("y2", 70)
        .attr("stroke", "#333")
        .attr("stroke-width", 1);
    moneySvg
        .append("rect")
        .attr("fill", "#FFF")
        .attr("width", 140)
        .attr("height", 30)
        .attr("x", 0)
        .attr("y", 70);
    gMoneysText = moneySvg.selectAll("text")
        .data([100,1000,5000,10000]);
    gMoneysText
        .enter()
        .append("text")
        .attr("x", function(d) { return 10 + Math.sqrt(d / Math.PI) * 2; })
        .attr("y", 82)
        .attr("font-size", 12)
        .attr("font-family", "\"PT Sans\", sans-serif")
        .attr("text-anchor", "middle")
        .text(function(d) { return d/1000; });
    legendContainer.append("div").style("width", "100%").style("font-size", "14px").style("margin", "10px auto 0").style("max-width", "600px").html("<strong>How to use this interactive:</strong> Hover or point to see details on different deals, such as the Chinese company involved, amount of the deal and name of the partner in the host country of the deal (when available). Click on the balls to find stories by SCMP on those deals.");
    countries.sort();
    draw();
}

function drawNotes () {
    notesContainer/*.style("width", width + "px").style("height", height + "px")*/.style("left", $(container.node()).offset().left + "px").style("top", $(container.node()).offset().top + "px");
    if (divNotes !== null) divNotes.remove();
    divNotes = notesContainer.selectAll("div")
        .data(notes);
    divNotes
        .enter()
        .append("div")
        .style("background-color", "#FFF")
        .style("border", "1px solid #EFEFEF")
        .style("line-height", "12px")
        .style("padding", "3px")
        .style("position", "absolute")
        .style("left", function (d) {
            return Math.max(margin.left + 10, margin.left + xDateScale(new Date(+d.pos.split(",")[0],+d.pos.split(",")[1],0))) + "px";
        })
        .style("top", function(d) {
            return margin.top + countries.indexOf(d.pos.split(",")[2]) * rh + 1 + "px";
        })
        .style("width", function(d) { return (xDateScale(new Date(2014,0,1)) - xDateScale(new Date(2013,0,1))) * .75 + "px"; })
        .style("font-size", "12px")
        .style("font-style", "italic")
        .html(function(d) { return d.note; });
    /*var notesLines = [];
    for (var i=0; i<notes.length; i++) {
        if (countries.indexOf(notes[i].pos.split(",")[2]) > countries.indexOf(notes[i].pos.split(",")[3])) { // text below target
            notesLines.push([[xDateScale(new Date(+d.pos.split(",")[0],+d.pos.split(",")[1],0)), countries.indexOf(notes[i].pos.split(",")[2]) * rh],
                                [xDateScale(new Date(+d.pos.split(",")[0],+d.pos.split(",")[1],0)), (countries.indexOf(notes[i].pos.split(",")[2]) - 3) * rh]
                                [xDateScale(new Date(+d.pos.split(",")[0]+1,+d.pos.split(",")[1],0)), (countries.indexOf(notes[i].pos.split(",")[2]) - 3) * rh]
                            ]);
        } else if (countries.indexOf(notes[i].pos.split(",")[2]) < countries.indexOf(notes[i].pos.split(",")[3])) { // text above target
             notesLines.push([[xDateScale(new Date(+d.pos.split(",")[0],+d.pos.split(",")[1],0)), countries.indexOf(notes[i].pos.split(",")[2]) * rh],
                                [xDateScale(new Date(+d.pos.split(",")[0],+d.pos.split(",")[1],0)), (countries.indexOf(notes[i].pos.split(",")[2]) - 3) * rh]
                                [xDateScale(new Date(+d.pos.split(",")[0]+1,+d.pos.split(",")[1],0)), (countries.indexOf(notes[i].pos.split(",")[2]) - 3) * rh]
                            ]);
        }
    }
    gNotes = container.selectAll("path.notes")
        .data();
    gNotes
        .enter()
        .append("path")
        .attr("stroke", "#333")
        .attr("fill", "transparent")
        .attr("d", line);
    var line = d3.svg.line()
        .x*/
}

function drawYears (y) {
    gYears = xScaleContainer.selectAll("g.year-" + y)
        .data(d3.range(2005,2015));
    gYears
        .enter()
        .append("g")
        .attr("class", "year-" + y)
        .attr("transform",function(d,i) {
            var x = xDateScale(new Date(d,0,1)) - (xDateScale(new Date(d+1,0,1)) - xDateScale(new Date(d,0,1))) / 24;
            return "translate(" + x + ", " + y + ")";
        });
    gYears
        .append("rect")
        .attr("width", function(d,i) {
            return xDateScale(new Date(d+1,0,1)) - xDateScale(new Date(d,0,1)) - 1;
        })
        .attr("height", 20);
    gYears
        .append("text")
        .attr("x", function(d,i) {
            return (xDateScale(new Date(d+1,0,1)) - xDateScale(new Date(d,0,1)))/2;
        })
        .attr("y", 15)
        .attr("font-size", 14)
        .attr("font-weight", 700)
        .attr("font-family", "\"PT Sans\", sans-serif")
        .attr("text-anchor", "middle")
        .attr("fill", "#FFF")
        .text(function(d){
            if (currentBreakPoint < breakpoints[3]) { var y = d % 2000; if (y < 10) y = "0" + y; return y; }
            return d;
        });
    gYears
        .append("line")
        .attr("x1", 0)
        .attr("x2", 0)
        .attr("y1", 15)
        .attr("y2", height)
        .attr("stroke", "#CCC")
        .attr("stroke-dasharray", "1 1")
        .attr("stroke-width", 1);
}

function draw () {
    var checkSizeBool = checkSize();
    if (currentBreakPoint > breakpoints[4]) drawNotes();
    else if (divNotes !== null) divNotes.remove();
    if (!checkSizeBool) {
        return 0;
    }
    if (checkingSize) return 0;
    checkingSize = true;
    if (gCountries !== null) gCountries.remove();
    if (gPoints !== null) gPoints.remove();
    if (xScaleContainer !== null) xScaleContainer.selectAll("g").remove();
    drawYears (0);
    drawYears (height-20);
    gCountries = yScaleContainer.selectAll("g.country")
        .data(countries);
    gCountries
        .enter()
        .append("g")
        .attr("class", "country")
        .attr("transform", function(d) {
            return "translate(0, " + (countries.indexOf(d) * rh) + ")";
        });
    gCountries
        .append("text")
        .attr("x", margin.left - 10)
        .attr("y", 3)
        .attr("text-anchor", "end")
        .attr("font-size", 12)
        .attr("font-weight", 400)
        .attr("font-family", "\"PT Sans\", sans-serif")
        .text(function(d){return d;});
    gCountries
        .append("line")
        .attr("x1", margin.left)
        .attr("x2", width)
        .attr("y1", 0)
        .attr("y2", 0)
        .attr("stroke", "#999")
        .attr("shape-rendering", "crispEdges")
        .attr("stroke-width", 1);
    gPoints = mainContainer.selectAll("g.point")
        .data(_data);
    gPoints
        .enter()
        .append("g")
        .attr("class", "point")
        .attr("transform", function(d) {
            return "translate(" + xDateScale(d.dat) + "," + (countries.indexOf(d.country) * rh) + ")";
        });
    gPoints
        .append("circle")
        .attr("r", function(d) { return Math.sqrt(d.quantity / Math.PI); })
        .attr("fill", function(d) {
            var sectors_index = sectors.indexOf(d.sector);
            if (sectors_index < 0) sectors_index = sectors.length - 1;
            return colours[sectors_index];
        })
        .attr("opacity", .8)
        .attr("stroke-width", 2)
        .attr("clip-path", "url(#cut-off-bottom)")
        .attr("stroke", "#FFF")
        .attr("stroke-width", 2)
        .style("cursor", "pointer")
        .on("mouseover", function(d) {
            d3.select(this).attr("stroke", "#333");
            d3.select(this).attr("opacity", 1);
            tooltip.style("left", (xDateScale(d.dat) + margin.left - 80 + $(container.node()).offset().left) + "px");
            tooltip.style("top", (countries.indexOf(d.country) * rh + 18 + $(container.node()).offset().top) - d3.select(this).attr("r") + "px");
            tooltipInside = tooltip.select(".tooltip-inside");
            /*var investorsArr = d.investor.split(",");
            var shareArr = d.share.split(",");
            if (investorsArr == shareArr.length) {
                for (var i=0; i<investorsArr.length; i++) {
                    investorArr[i] = investorArr[i] + " (" + shareArr[i] + ")";
                }
                investorTxt.join(",");
            } else {
                investorTxt = d.investor;
            }*/
            investorTxt = d.investor;
            if (d.share !== "") investorTxt += " (" + d.share + ")";
            var dollars = (d.quantity >= 1000) ? (d.quantity/1000).toFixed(2) + ' billion' : d.quantity + ' million';
            tooltipTxt = '<div style="font-size:14px;"><em>' + d.month + " " + d.year + '</em></div>' + '<div style="font-size:14px;"><strong>' + investorTxt + '</strong></div>' + '<div style="font-size:20px;margin:10px 0 7px;">US$' + dollars + '</div>' + '<div style="font-size:14px;"><strong>' + d.country + '</strong></div>';
            if (d.partner !== "") tooltipTxt += '<div style="font-size:12px;"><strong>(' + d.partner.replace(/ +$/,"") + ')</strong></div>';
            tooltipTxt += '<div style="font-size:12px;"><em>' + d.sector + '</em></div>';
            if (d.subsector !== "") tooltipTxt += '<div style="font-size:12px;"><em>' + d.subsector + '</em></div>';
            tooltipInside.html(tooltipTxt);
            tooltip.style("display", "block");
            tooltip.style("top", +tooltip.style("top").replace(/px/, "") - (tooltip.node().offsetHeight - 72) + "px");
        })
        .on("mouseout", function(d) {
            d3.select(this).attr("stroke", "#FFF");
            d3.select(this).attr("opacity", .8);
            tooltip.style("display", "none");
        })
        .on("click", function(d) {
            if (currentBreakPoint < breakpoints[3]) return 0;
            var url = "https://www.google.com/search?q=site%3Ascmp.com+\"" + d.investor + '\"';
            if (d.partner !== "") url += '+"' + d.partner.replace(/[ ,\."']+/,"+") + '"';
            else  url += '+"' + d.country.replace(/[ ,\."']+/,"+") + '"';
            window.open(url);
        });
    checkingSize = false;
}

function checkSize () {
    var w = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
    var newBreakPoint = -1;
    for (var i=0; i<breakpoints.length-1; i++) {
        if (w > breakpoints[i] && w < breakpoints[i+1]) {
            newBreakPoint = breakpoints[i];
            break;
        }
    }
    if (newBreakPoint == -1) newBreakPoint = breakpoints[breakpoints.length-1];
    if (currentBreakPoint == newBreakPoint) return false;
    else currentBreakPoint = newBreakPoint;
    height = 133 * rh + margin.top;
    width = currentBreakPoint;
    xDateScale.range([0,width-margin.left]);
    container.attr("width", width).attr("height", height);
    return true;
}

window.addEventListener("resize", draw);

})();
