/*******************************************************************\

Module: API to expression classes for Pointers

Author: Daniel Kroening, kroening@kroening.com

\*******************************************************************/

#ifndef CPROVER_UTIL_POINTER_EXPR_H
#define CPROVER_UTIL_POINTER_EXPR_H

/// \file util/pointer_expr.h
/// API to expression classes for Pointers

#include "bitvector_types.h"
#include "std_expr.h"

class namespacet;

/// The pointer type
/// These are both 'bitvector_typet' (they have a width)
/// and 'type_with_subtypet' (they have a subtype)
class pointer_typet : public bitvector_typet
{
public:
  pointer_typet(typet _subtype, std::size_t width)
    : bitvector_typet(ID_pointer, width)
  {
    subtype().swap(_subtype);
  }

  signedbv_typet difference_type() const
  {
    return signedbv_typet(get_width());
  }

  static void check(
    const typet &type,
    const validation_modet vm = validation_modet::INVARIANT)
  {
    DATA_CHECK(vm, !type.get(ID_width).empty(), "pointer must have width");
  }
};

/// Check whether a reference to a typet is a \ref pointer_typet.
/// \param type: Source type.
/// \return True if \p type is a \ref pointer_typet.
template <>
inline bool can_cast_type<pointer_typet>(const typet &type)
{
  return type.id() == ID_pointer;
}

/// \brief Cast a typet to a \ref pointer_typet
///
/// This is an unchecked conversion. \a type must be known to be \ref
/// pointer_typet. Will fail with a precondition violation if type
/// doesn't match.
///
/// \param type: Source type.
/// \return Object of type \ref pointer_typet.
inline const pointer_typet &to_pointer_type(const typet &type)
{
  PRECONDITION(can_cast_type<pointer_typet>(type));
  pointer_typet::check(type);
  return static_cast<const pointer_typet &>(type);
}

/// \copydoc to_pointer_type(const typet &)
inline pointer_typet &to_pointer_type(typet &type)
{
  PRECONDITION(can_cast_type<pointer_typet>(type));
  pointer_typet::check(type);
  return static_cast<pointer_typet &>(type);
}

/// This method tests,
/// if the given typet is a pointer of type void.
inline bool is_void_pointer(const typet &type)
{
  return type.id() == ID_pointer && type.subtype().id() == ID_empty;
}

/// The reference type
///
/// Intends to model C++ reference. Comparing to \ref pointer_typet should
/// never be null.
class reference_typet : public pointer_typet
{
public:
  reference_typet(typet _subtype, std::size_t _width)
    : pointer_typet(std::move(_subtype), _width)
  {
    set(ID_C_reference, true);
  }

  static void check(
    const typet &type,
    const validation_modet vm = validation_modet::INVARIANT)
  {
    PRECONDITION(type.id() == ID_pointer);
    const reference_typet &reference_type =
      static_cast<const reference_typet &>(type);
    DATA_CHECK(
      vm, !reference_type.get(ID_width).empty(), "reference must have width");
    DATA_CHECK(
      vm, reference_type.get_width() > 0, "reference must have non-zero width");
  }
};

/// Check whether a reference to a typet is a \ref reference_typet.
/// \param type: Source type.
/// \return True if \p type is a \ref reference_typet.
template <>
inline bool can_cast_type<reference_typet>(const typet &type)
{
  return can_cast_type<pointer_typet>(type) && type.get_bool(ID_C_reference);
}

/// \brief Cast a typet to a \ref reference_typet
///
/// This is an unchecked conversion. \a type must be known to be \ref
/// reference_typet. Will fail with a precondition violation if type
/// doesn't match.
///
/// \param type: Source type.
/// \return Object of type \ref reference_typet.
inline const reference_typet &to_reference_type(const typet &type)
{
  PRECONDITION(can_cast_type<reference_typet>(type));
  return static_cast<const reference_typet &>(type);
}

/// \copydoc to_reference_type(const typet &)
inline reference_typet &to_reference_type(typet &type)
{
  PRECONDITION(can_cast_type<reference_typet>(type));
  return static_cast<reference_typet &>(type);
}

bool is_reference(const typet &type);

bool is_rvalue_reference(const typet &type);

/// \brief Split an expression into a base object and a (byte) offset
class object_descriptor_exprt : public binary_exprt
{
public:
  object_descriptor_exprt()
    : binary_exprt(
        exprt(ID_unknown),
        ID_object_descriptor,
        exprt(ID_unknown),
        typet())
  {
  }

  explicit object_descriptor_exprt(exprt _object)
    : binary_exprt(
        std::move(_object),
        ID_object_descriptor,
        exprt(ID_unknown),
        typet())
  {
  }

  /// Given an expression \p expr, attempt to find the underlying object it
  /// represents by skipping over type casts and removing balanced
  /// dereference/address_of operations; that object will then be available
  /// as root_object().
  void build(const exprt &expr, const namespacet &ns);

  exprt &object()
  {
    return op0();
  }

  const exprt &object() const
  {
    return op0();
  }

  const exprt &root_object() const;

  exprt &offset()
  {
    return op1();
  }

  const exprt &offset() const
  {
    return op1();
  }
};

template <>
inline bool can_cast_expr<object_descriptor_exprt>(const exprt &base)
{
  return base.id() == ID_object_descriptor;
}

inline void validate_expr(const object_descriptor_exprt &value)
{
  validate_operands(value, 2, "Object descriptor must have two operands");
}

/// \brief Cast an exprt to an \ref object_descriptor_exprt
///
/// \a expr must be known to be \ref object_descriptor_exprt.
///
/// \param expr: Source expression
/// \return Object of type \ref object_descriptor_exprt
inline const object_descriptor_exprt &
to_object_descriptor_expr(const exprt &expr)
{
  PRECONDITION(expr.id() == ID_object_descriptor);
  const object_descriptor_exprt &ret =
    static_cast<const object_descriptor_exprt &>(expr);
  validate_expr(ret);
  return ret;
}

/// \copydoc to_object_descriptor_expr(const exprt &)
inline object_descriptor_exprt &to_object_descriptor_expr(exprt &expr)
{
  PRECONDITION(expr.id() == ID_object_descriptor);
  object_descriptor_exprt &ret = static_cast<object_descriptor_exprt &>(expr);
  validate_expr(ret);
  return ret;
}

/// Representation of heap-allocated objects
class dynamic_object_exprt : public binary_exprt
{
public:
  explicit dynamic_object_exprt(typet type)
    : binary_exprt(
        exprt(ID_unknown),
        ID_dynamic_object,
        exprt(ID_unknown),
        std::move(type))
  {
  }

  void set_instance(unsigned int instance);

  unsigned int get_instance() const;

  exprt &valid()
  {
    return op1();
  }

  const exprt &valid() const
  {
    return op1();
  }
};

template <>
inline bool can_cast_expr<dynamic_object_exprt>(const exprt &base)
{
  return base.id() == ID_dynamic_object;
}

inline void validate_expr(const dynamic_object_exprt &value)
{
  validate_operands(value, 2, "Dynamic object must have two operands");
}

/// \brief Cast an exprt to a \ref dynamic_object_exprt
///
/// \a expr must be known to be \ref dynamic_object_exprt.
///
/// \param expr: Source expression
/// \return Object of type \ref dynamic_object_exprt
inline const dynamic_object_exprt &to_dynamic_object_expr(const exprt &expr)
{
  PRECONDITION(expr.id() == ID_dynamic_object);
  const dynamic_object_exprt &ret =
    static_cast<const dynamic_object_exprt &>(expr);
  validate_expr(ret);
  return ret;
}

/// \copydoc to_dynamic_object_expr(const exprt &)
inline dynamic_object_exprt &to_dynamic_object_expr(exprt &expr)
{
  PRECONDITION(expr.id() == ID_dynamic_object);
  dynamic_object_exprt &ret = static_cast<dynamic_object_exprt &>(expr);
  validate_expr(ret);
  return ret;
}

/// Evaluates to true if the operand is a pointer to a dynamic object.
class is_dynamic_object_exprt : public unary_predicate_exprt
{
public:
  explicit is_dynamic_object_exprt(const exprt &op)
    : unary_predicate_exprt(ID_is_dynamic_object, op)
  {
  }
};

inline const is_dynamic_object_exprt &
to_is_dynamic_object_expr(const exprt &expr)
{
  PRECONDITION(expr.id() == ID_is_dynamic_object);
  DATA_INVARIANT(
    expr.operands().size() == 1, "is_dynamic_object must have one operand");
  return static_cast<const is_dynamic_object_exprt &>(expr);
}

/// \copydoc to_is_dynamic_object_expr(const exprt &)
/// \ingroup gr_std_expr
inline is_dynamic_object_exprt &to_is_dynamic_object_expr(exprt &expr)
{
  PRECONDITION(expr.id() == ID_is_dynamic_object);
  DATA_INVARIANT(
    expr.operands().size() == 1, "is_dynamic_object must have one operand");
  return static_cast<is_dynamic_object_exprt &>(expr);
}

/// \brief Operator to return the address of an object
class address_of_exprt : public unary_exprt
{
public:
  explicit address_of_exprt(const exprt &op);

  address_of_exprt(exprt op, pointer_typet _type)
    : unary_exprt(ID_address_of, std::move(op), std::move(_type))
  {
  }

  exprt &object()
  {
    return op0();
  }

  const exprt &object() const
  {
    return op0();
  }
};

template <>
inline bool can_cast_expr<address_of_exprt>(const exprt &base)
{
  return base.id() == ID_address_of;
}

inline void validate_expr(const address_of_exprt &value)
{
  validate_operands(value, 1, "Address of must have one operand");
}

/// \brief Cast an exprt to an \ref address_of_exprt
///
/// \a expr must be known to be \ref address_of_exprt.
///
/// \param expr: Source expression
/// \return Object of type \ref address_of_exprt
inline const address_of_exprt &to_address_of_expr(const exprt &expr)
{
  PRECONDITION(expr.id() == ID_address_of);
  const address_of_exprt &ret = static_cast<const address_of_exprt &>(expr);
  validate_expr(ret);
  return ret;
}

/// \copydoc to_address_of_expr(const exprt &)
inline address_of_exprt &to_address_of_expr(exprt &expr)
{
  PRECONDITION(expr.id() == ID_address_of);
  address_of_exprt &ret = static_cast<address_of_exprt &>(expr);
  validate_expr(ret);
  return ret;
}

/// \brief Operator to dereference a pointer
class dereference_exprt : public unary_exprt
{
public:
  explicit dereference_exprt(const exprt &op)
    : unary_exprt(ID_dereference, op, op.type().subtype())
  {
    PRECONDITION(op.type().id() == ID_pointer);
  }

  dereference_exprt(exprt op, typet type)
    : unary_exprt(ID_dereference, std::move(op), std::move(type))
  {
  }

  exprt &pointer()
  {
    return op0();
  }

  const exprt &pointer() const
  {
    return op0();
  }

  static void check(
    const exprt &expr,
    const validation_modet vm = validation_modet::INVARIANT)
  {
    DATA_CHECK(
      vm,
      expr.operands().size() == 1,
      "dereference expression must have one operand");
  }

  static void validate(
    const exprt &expr,
    const namespacet &ns,
    const validation_modet vm = validation_modet::INVARIANT);
};

template <>
inline bool can_cast_expr<dereference_exprt>(const exprt &base)
{
  return base.id() == ID_dereference;
}

inline void validate_expr(const dereference_exprt &value)
{
  validate_operands(value, 1, "Dereference must have one operand");
}

/// \brief Cast an exprt to a \ref dereference_exprt
///
/// \a expr must be known to be \ref dereference_exprt.
///
/// \param expr: Source expression
/// \return Object of type \ref dereference_exprt
inline const dereference_exprt &to_dereference_expr(const exprt &expr)
{
  PRECONDITION(expr.id() == ID_dereference);
  const dereference_exprt &ret = static_cast<const dereference_exprt &>(expr);
  validate_expr(ret);
  return ret;
}

/// \copydoc to_dereference_expr(const exprt &)
inline dereference_exprt &to_dereference_expr(exprt &expr)
{
  PRECONDITION(expr.id() == ID_dereference);
  dereference_exprt &ret = static_cast<dereference_exprt &>(expr);
  validate_expr(ret);
  return ret;
}

/// \brief The null pointer constant
class null_pointer_exprt : public constant_exprt
{
public:
  explicit null_pointer_exprt(pointer_typet type)
    : constant_exprt(ID_NULL, std::move(type))
  {
  }
};

#endif // CPROVER_UTIL_POINTER_EXPR_H
