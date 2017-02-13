let rec reverseHelp place str newStr =
  let revStr = Char.escaped str.[place] in
  let currPlace = place - 1 in
  if place > 0 then
    revStr ^ reverseHelp currPlace str
  else
    revStr 
  

let reverse str =
  let currChar = str.[0] in 
  str

let testVal = "fast"
let strLen = String.length testVal
let place = strLen - 1
let _ = print_string(reverseHelp place testVal)