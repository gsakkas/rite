(*F*)

let rec length = function 
  | [] -> 0.0
  | _ :: t -> suc (length t)

let _ =
  length [] + 1
