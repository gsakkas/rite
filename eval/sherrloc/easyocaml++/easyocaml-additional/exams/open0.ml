(*S*)
let x = Stack.create ()

let _ =
  try
    Stack.push 3 x ;
    print_int (Stack.pop x) ;
    print_int (Stack.pop x) ;
  with Stack.Empty ->
    print_string "is empty"
