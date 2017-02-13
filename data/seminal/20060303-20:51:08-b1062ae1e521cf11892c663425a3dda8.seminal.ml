type 'a lst = Null
            | Cons of 'a * 'a lst

let x = Cons(3, Null)
let rec prnt lst = 
    match lst with
        Null -> ""
   |    Cons(y,rest) -> print_string y ^ prnt rest


let _ = prnt x
