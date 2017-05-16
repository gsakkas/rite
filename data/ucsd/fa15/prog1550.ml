
let rec listReverse l =
  match l with | [] -> [1] | front::back -> [listReverse back; front];;
