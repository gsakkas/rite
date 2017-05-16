
let rec reverseLt list ys = match ys with | h::t -> (reverseLt t) @ [h];;
