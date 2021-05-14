exception Failure = Failure
let failwith x = raise (Failure x)
let exit i = exit (Z.to_int i)
let pipe_right a f = f a
let pipe_left f a = f a
let try_with f1 f2 = try f1 () with | e -> f2 e
let op_Less_Bar = pipe_left
let op_Bar_Greater = pipe_right
