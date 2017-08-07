function GMDoc() {
    this.isFolder = function (object) {
        return (object.resources != undefined);
    }

    this.isScript = function (object) {
        return (object.parameters != undefined);
    }

    this.isObject = function (object) {
        return (object.variables != undefined);
    }
}

function GMFolder(object) {
    this.name = "";
    this.resources = [];

    for (var property in object) {
        this[property] = object[property];
    }

    // Sort resources by name
    this.resources.sort(function (a, b) {
        if (a.name < b.name) {
            return -1;
        }
        if (a.name > b.name) {
            return 1;
        }
        return 0;
    });
}

function GMScript(object) {
    this.name = "";
    this.declaration = "";
    this.brief = "";
    this.parameters = [];
    this.returnValue = "";
    this.note = "";
    this.references = [];

    for (var property in object) {
        this[property] = object[property];
    }

    // Sort references by name
    this.references.sort();
}

function GMParameter(object) {
    this.name = "";
    this.type = "";
    this.description = "";

    for (var property in object) {
        this[property] = object[property];
    }
}

function GMReturnValue(object) {
    this.type = "";
    this.description = "";

    for (var property in object) {
        this[property] = object[property];
    }
}

function GMObject(object) {
    this.name = "";
    this.parent = "";
    this.description = "";
    this.variables = [];

    for (var property in object) {
        this[property] = object[property];
    }

    // Sort variables by name
    this.variables.sort(function (a, b) {
        if (a.name < b.name) {
            return -1;
        }
        if (a.name > b.name) {
            return 1;
        }
        return 0;
    });
}

function GMVariable(object) {
    this.name = "";
    this.description = "";

    for (var property in object) {
        this[property] = object[property];
    }
}