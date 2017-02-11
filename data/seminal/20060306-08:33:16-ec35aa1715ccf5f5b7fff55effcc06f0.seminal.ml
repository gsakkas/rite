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
  reverseHelp place str



let rec mapHelp f place str len =
  let currPlace = place + 1 in
  if currPlace >= len then 
    []
  else
    (f str.[place])::(mapHelp f currPlace str len)


let map f str =
  let strLen = String.length str in
  match str with
      ""	-> []
    | _	-> mapHelp f 0 str strLen


let upperMatch ch = 
  match ch with
      'a' .. 'z'	-> char_of_int(int_of_char(ch)-32)
    | ret 		-> print_char ret;ret

let rec listToString lst str =
  match lst with
      []		-> ""
    | hd::tl	-> listToString tl str^hd

let uppercase s =
  let upperStr = map upperMatch s in
    listToString upperStr ""

let test = uppercase("redskins")
let _ = print_string test

