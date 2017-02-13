let rec reverseHelp place str =
  let revStr = Char.escaped str.[place] in 
  if place > 0 then
    let currPlace = place - 1 in
    revStr ^ reverseHelp currPlace (str ^ Char.escaped str.[place])
  

let reverse str =
  let currChar = str.[0] in 
  str

let testVal = "fast"
let strLen = String.length testVal
let place = strLen - 1
let _ = print_string(reverseHelp place testVal)