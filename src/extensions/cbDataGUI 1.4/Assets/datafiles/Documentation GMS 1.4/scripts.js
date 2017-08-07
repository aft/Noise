// Prints resource tree to the #menu element.
function printResourceTree(resource, folderPrefix) {
    var html = "";
    var gmDoc = new GMDoc();
    if (gmDoc.isFolder(resource)) {
        var folder = new GMFolder(resource);
        var id = folderPrefix + folder.name + "_" + (gmDocFolderNumber++);
        html += "<li class='folder' onclick='collapse(this, document.getElementById(\"" + id + "\"))'><b>" + folder.name + "</b></li>";
        html += "<ul id='" + id + "' class='hidden'>";
        for (var i = 0; i < folder.resources.length; i++) {
            html += printResourceTree(folder.resources[i], folderPrefix);
        }
        html += "</ul>";
    } else if (gmDoc.isScript(resource)) {
        var script = new GMScript(resource);
        html += "<li><a href='#" + script.name + "'>" + script.name + "</a></li>";
    } else if (gmDoc.isObject(resource)) {
        var object = new GMObject(resource);
        html += "<li><a href='#" + object.name + "'>" + object.name + "</a></li>";
    }
    return html;
}

function collapse(folder, element) {
    folder.classList.toggle("expanded");
    if (element.className == "") {
        element.className = "hidden";
    } else {
        element.className = "";
    }
}

// Prints scripts and objects to the #pages element.
function printResource(resource) {
    var html = "";
    var gmDoc = new GMDoc();
    if (gmDoc.isFolder(resource)) {
        var folder = new GMFolder(resource);
        for (var i = 0; i < folder.resources.length; i++) {
            html += printResource(folder.resources[i]);
        }
    } else if (gmDoc.isObject(resource)) {
        html += (new GMObject(resource)).toHTML();
    } else if (gmDoc.isScript(resource)) {
        var script = new GMScript(resource);
        html += (new GMScript(resource)).toHTML();
    }
    return html;
}

// Returns a string containing HTML documentation for the given object.
GMObject.prototype.toHTML = function () {
    var html = "<div id='" + this.name + "' class='page'>";

    // Name
    html += "<h1>" + this.name;
    if (this.parent != "<undefined>") {
        html += " : <a href='#" + this.parent + "'>" + this.parent + "</a>"; // Parent
    }
    html += "</h1>";

    // Description
    if (this.description != "") {
        html += "<h2>Description</h2>" + this.description;
    }

    // Variables
    if (this.variables.length > 0) {
        html += "<h2>Variables</h2><table>";
        for (var i = 0; i < this.variables.length; i++) {
            var variable = new GMVariable(this.variables[i]);
            html += "<tr><td>" + variable.name + "</td><td>" + variable.description + "</td>";
        }
        html += "</table>";
    }

    html += "</div>";
    return html;
};

// Returns a string containing HTML documentation for the given script.
GMScript.prototype.toHTML = function () {
    var html = "<div id='" + this.name + "' class='page'>";

    // Name
    html += "<h1>" + this.name + "</h1>";

    // Declaration
    html += "<div class='code'>" + this.declaration + "</div>";

    // Description
    if (this.brief != "") {
        html += "<h2>Description</h2>" + this.brief;
    }

    // Parameters
    if (this.parameters.length > 0) {
        html += "<h2>Parameters</h2><table>";
        for (var i = 0; i < this.parameters.length; i++) {
            var param = new GMParameter(this.parameters[i]);
            html += "<tr><td>" + param.name + "</td><td><i>" + param.type
                + "</i></td><td>" + param.description + "</td></tr>";
        }
        html += "</table>";
    }

    // Return value
    var returnValue = new GMReturnValue(this.returnValue);
    if (returnValue.description != "") {
        html += "<h2>Return</h2>";
        if (returnValue.type != "") {
            html += returnValue.type + " - ";
        }
        html += returnValue.description;
    }

    // Note
    if (this.note != "") {
        html += "<h2>Note</h2>" + this.note;
    }

    // References
    if (this.references.length > 0) {
        html += "<h2>See also</h2>";
        for (var i = 0; i < this.references.length; i++) {
            var reference = this.references[i];
            html += "<a href='#" + reference + "'>" + reference + "</a> ";
        }
    }

    html += "</div>";
    return html;
};

var scripts = JSON.parse(GMDocScripts);
var objects = JSON.parse(GMDocObjects);
var menuHtml = "";
var pagesHtml = "";
var gmDocFolderNumber = 0;

if (objects.length > 0) {
    menuHtml += "<h3>Objects</h3>";
    for (var i = 0; i < objects.length; i++) {
        menuHtml += "<ul>";
        menuHtml += printResourceTree(objects[i], "objFolder_");
        menuHtml += "</ul>";
        pagesHtml += printResource(objects[i]);
    }
}

if (scripts.length > 0) {
    menuHtml += "<h3>Scripts</h3>";
    for (var i = 0; i < scripts.length; i++) {
        menuHtml += "<ul>";
        menuHtml += printResourceTree(scripts[i], "scrFolder_", 0);
        menuHtml += "</ul>";
        pagesHtml += printResource(scripts[i]);
    }
}

document.getElementById("menu").innerHTML += menuHtml;
document.getElementById("pages").innerHTML = pagesHtml
    + document.getElementById("pages").innerHTML;
