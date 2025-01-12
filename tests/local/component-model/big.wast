(component
  (import "wasi:logging" (instance $logging
    (export "log" (func (param string)))
  ))
  (import "libc" (core module $Libc
    (export "memory" (memory 1))
    (export "realloc" (func (param i32 i32 i32 i32) (result i32)))
  ))
  (core instance $libc (instantiate $Libc))
  (core func $log (canon lower
    (func $logging "log")
    (memory (core memory $libc "memory")) (realloc (core func $libc "realloc"))
  ))
  (core module $Main
    (import "libc" "memory" (memory 1))
    (import "libc" "realloc" (func (param i32 i32 i32 i32) (result i32)))
    (import "wasi:logging" "log" (func $log (param i32 i32)))
    (func (export "run") (param i32 i32) (result i32)
      (local.get 0)
      (local.get 1)
      (call $log)
      (unreachable)
    )
  )
  (core instance $main (instantiate $Main
    (with "libc" (instance $libc))
    (with "wasi:logging" (instance (export "log" (func $log))))
  ))
  (func $run (param string) (result string) (canon lift
    (core func $main "run")
    (memory (core memory $libc "memory")) (realloc (core func $libc "realloc"))
  ))
  (export "run" (func $run))
)
