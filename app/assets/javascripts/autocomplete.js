var substringMatcher = function(strs) {
return function findMatches(q, cb) {
var matches, substrRegex;
 
// an array that will be populated with substring matches
matches = [];
 
// regex used to determine if a string contains the substring `q`
substrRegex = new RegExp(q, 'i');
 
// iterate through the pool of strings and for any string that
// contains the substring `q`, add it to the `matches` array
$.each(strs, function(i, str) {
if (substrRegex.test(str)) {
// the typeahead jQuery plugin expects suggestions to a
// JavaScript object, refer to typeahead docs for more info
matches.push({ value: str });
}
});
 
cb(matches);
};
};
 
var classes = ['CSE 1000', 'CSE 1222', 'CSE 2221', 'CSE 2231', 'CSE 2321',
'CSE 2331', 'CSE 2421', 'CSE 2431', 'CSE 2501', 'CSE 3231', 'CSE 3241',
'CSE 3321', 'CSE 3341', 'CSE 3521', 'CSE 3541', 'CSE 3901', 'CSE 3902', 'CSE 3903',
'CSE 4251', 'CSE 4252', 'CSE 5911', 'CSE 5912', 'ECE 2000', 'ECE 2100','Math 1151', 'Math 1152','Math 1153','Math 3345'];
 
$('#the-basics .typeahead').typeahead({
hint: true,
highlight: true,
minLength: 1
},
{
name: 'classes',
displayKey: 'value',
source: substringMatcher(classes)
});