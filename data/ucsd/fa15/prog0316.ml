
let rec listReverse l =
  match l with | [] -> [] | front::back -> [[listReverse back]; front];;
