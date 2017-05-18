
let rec multHelper i l =
  match l with
  | [] -> []
  | h::t ->
      let x = h * i in
      (match x with
       | x when x >= 10 -> (multHelper i t) @ ((x / 10), (x mod 10))
       | _ -> (0, x) @ (multiHelper i t));;
