let rec reverseHelp place str =
  let revStr = Char.escaped str.[place] in
  let currPlace = place - 1 in
  if place > 0 then
    revStr ^ reverseHelp currPlace str
  else
    revStr 
  

let reverse str =
  let strLen = String.length str in
  let place = strLen - 1 in
  let currChar = str.[0] in 
  reverseHelp place str



let mapHelp f str place =
  match str with
      "" 	-> []
    | hd::tl		-> []


let mapHelp1 f str =
  match str.[0] with
      ' ' 	-> []
    | _		-> []


let map f str =
  match str with
      ""	-> []
    | st	-> mapHelp f st 0

let _ = print_string(reverse "redskins")
