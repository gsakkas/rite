let rec reverseHelp place str =
  if place > 0 then  
    reverseHelp place-1 (str ^ Char.escaped str.[place])
  else
    str ^ Char.escaped str.[place]

let reverse str =
  let currChar = str.[0] in 
  str

let testVal = "fast"
let strLen = String.length testVal
let place = strLen - 1
let _ = print_string(reverseHelp place testVal)