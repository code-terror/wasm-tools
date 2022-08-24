;; --enable-simd --enable-relaxed-simd
(module
  (func $swizzle (param v128 v128) (result v128)
    local.get 0
    local.get 1
    i8x16.relaxed_swizzle)

  (func $i32x4_trunc_f32x4_s (param v128) (result v128)
    local.get 0
    i32x4.relaxed_trunc_f32x4_s)

  (func $i32x4_trunc_f32x4_u (param v128) (result v128)
    local.get 0
    i32x4.relaxed_trunc_f32x4_u)

  (func $i32x4.trunc_f64x2_s_zero (param v128) (result v128)
    local.get 0
    i32x4.relaxed_trunc_f64x2_s_zero)

  (func $i32x4.trunc_f64x2_u_zero (param v128) (result v128)
    local.get 0
    i32x4.relaxed_trunc_f64x2_u_zero)

  (func $f32x4_fma (param v128 v128 v128) (result v128)
    local.get 0
    local.get 1
    local.get 2
    f32x4.fma)

  (func $f32x4_fms (param v128 v128 v128) (result v128)
    local.get 0
    local.get 1
    local.get 2
    f32x4.fms)

  (func $f64x2_fma (param v128 v128 v128) (result v128)
    local.get 0
    local.get 1
    local.get 2
    f64x2.fma)

  (func $f64x2_fms (param v128 v128 v128) (result v128)
    local.get 0
    local.get 1
    local.get 2
    f64x2.fms)

  (func $i8x16_laneselect (param v128 v128 v128) (result v128)
    local.get 0
    local.get 1
    local.get 2
    i8x16.laneselect)

  (func $i16x8_laneselect (param v128 v128 v128) (result v128)
    local.get 0
    local.get 1
    local.get 2
    i16x8.laneselect)

  (func $i32x4_laneselect (param v128 v128 v128) (result v128)
    local.get 0
    local.get 1
    local.get 2
    i32x4.laneselect)

  (func $i64x2_laneselect (param v128 v128 v128) (result v128)
    local.get 0
    local.get 1
    local.get 2
    i64x2.laneselect)

  (func $f32x4_min (param v128 v128) (result v128)
    local.get 0
    local.get 1
    f32x4.relaxed_min)

  (func $f32x4_max (param v128 v128) (result v128)
    local.get 0
    local.get 1
    f32x4.relaxed_max)

  (func $f64x2_min (param v128 v128) (result v128)
    local.get 0
    local.get 1
    f64x2.relaxed_min)

  (func $f64x2_max (param v128 v128) (result v128)
    local.get 0
    local.get 1
    f64x2.relaxed_max)
)
