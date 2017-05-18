
let getHead b = match b with | [] -> [] | x::xs -> x;;

let rec listReverse l =
  let a = [] in
  let getHead b = match b with | [] -> [] | x::xs -> x :: (a getHead xs) in
  getHead l;;
