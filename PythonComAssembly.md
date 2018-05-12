You could create a C extension wrapper for the functions implemented in assembly and link it to the OBJ file created by nasm.

A dummy example (for 32 bit Python 2; not tested):

myfunc.asm:

'''
;http://www.nasm.us/doc/nasmdoc9.html
global  _myfunc 
section .text
_myfunc: 
    push    ebp 
    mov     ebp,esp 
    sub     esp,0x40        ; 64 bytes of local stack space 
    mov     ebx,[ebp+8]     ; first parameter to function 
    ; some more code 
    leave
    ret
'''

myext.c:

'''c
#include <Python.h>

void myfunc(void);

static PyObject*
py_myfunc(PyObject* self, PyObject* args)
{
    if (!PyArg_ParseTuple(args, ""))
        return NULL;
    myfunc();
    Py_RETURN_NONE;
}

static PyMethodDef MyMethods[] =
{
    {"myfunc", py_myfunc, METH_VARARGS, NULL},
    {NULL, NULL, 0, NULL}
};

PyMODINIT_FUNC initmyext(void)
{
    (void) Py_InitModule("myext", MyMethods);
}
'''

setup.py:

'''python
from distutils.core import setup, Extension
setup(name='myext', ext_modules=[
    Extension('myext', ['myext.c'], extra_objects=['myfunc.obj'])])

Build and run:

nasm -fwin32 myfunc.asm

python setup.py build_ext --inplace

python -c"import myext;myext.myfunc()"
'''
