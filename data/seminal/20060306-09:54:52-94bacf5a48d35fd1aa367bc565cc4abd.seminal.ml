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
  if currPlace > len then 
    []
  else
    (f str.[place])::(mapHelp f currPlace str len)


let map f str =
  let strLen = String.length str in
  match str with
      ""	-> []
    | _		-> mapHelp f 0 str strLen


let upperMatch ch = 
  match ch with
      'a' .. 'z'	-> char_of_int(int_of_char(ch)-32)
    | ret 			-> ret

let rec listToString lst str =
  match lst with
      []		-> str
    | hd::tl	-> listToString tl (str ^ (Char.escaped hd))

let uppercase s =
  let upperStr = map upperMatch s in
    listToString upperStr ""
    
    
let lowerMatch ch = 
  match ch with
      'A' .. 'Z'	-> char_of_int(int_of_char(ch)+32)
    | ret 			-> ret
    
let lowercase s =
  let lowerStr = map lowerMatch s in
    listToString lowerStr ""


    
let rec fold_left_help f init str len place = 
  let currPlace = place + 1 in
  if currPlace > len then 
    []
  else
    print_string init;fold_left_help f (f init str.[place]) str len currPlace

  
let fold_left f init str =
  let strLen = String.length str in
  match str with
      ""	-> []
    | _		-> fold_left_help f init str strLen 0

    
let titleFun prevCh currCh =
  match (prevCh, currCh) with
      (' ','a' .. 'z') 	-> upperMatch currCh
    | (_, 'A' .. 'Z')	-> lowerMatch currCh
    | (_, _)			-> currCh  


let titlecase s =
  let titleCase = fold_left titleFun ' ' s in
    listToString titleCase ""

let test = titlecase("rEDSKINs1")
let _ = print_string(test)

