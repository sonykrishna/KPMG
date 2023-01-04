var printRes = "";
    var finalKey = "";
function getObject(theObject) {
    var result = null;
    for(var prop in theObject) {
        printRes = prop+"/"+printRes;
        if(typeof theObject[prop] === 'object') {
            result = getObject(theObject[prop]);
            if (result) {
                break;
            }
        } else if(typeof theObject[prop] === 'string'){
        finalKey =  theObject[prop];
        }
    }
   
    return result;
}
var obj = {"x": {"y":{"z":"a"}}}; // pass object here
getObject(obj);
printRes = printRes.split("").reverse();
printRes.shift();
printRes = printRes.join("");
console.log("key= ", printRes);
console.log("value= ",finalKey);