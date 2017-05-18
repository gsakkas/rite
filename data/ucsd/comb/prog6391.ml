
let rec listReverse l =
  match l with | [] -> [] | front::back -> back :: front;;
