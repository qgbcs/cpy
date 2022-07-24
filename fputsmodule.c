#include <stdio.h>
#include <time.h>

void stime(char *output){
    time_t rawtime;
    struct tm * timeinfo;
    
    time(&rawtime);
    timeinfo = localtime(&rawtime);
    // 2022-07-24__11.49.09
    sprintf(output, "%04d-%02d-%02d__%02d.%02d.%02d",
			timeinfo->tm_year + 1900,timeinfo->tm_mon + 1,timeinfo->tm_mday,
            
            timeinfo->tm_hour, timeinfo->tm_min, timeinfo->tm_sec);
}

int main ()
{
  char st[20];stime(st);
  
  printf ( "Current local time and date: %s", st );
  
  return 0;
}


#include <Python.h>
static PyObject *method_fputs(PyObject *self, PyObject *args) {
    char *str, *filename = NULL;
    int bytes_copied = -1;

    /* Parse arguments */
    if(!PyArg_ParseTuple(args, "ss", &str, &filename)) {
        return NULL;
    }
	char st[20];stime(st);
    char* stmp = (char *) malloc( strlen(filename) + 1 +20); 

	sprintf(stmp, "%s=%s",st,filename);

    FILE *fp = fopen(stmp, "w");
    bytes_copied = fputs(str, fp);
    fclose(fp);

    return PyLong_FromLong(bytes_copied);
}


static PyObject * method_system(PyObject *self, PyObject *args)
{
    const char *command;
    int sts;

    if (!PyArg_ParseTuple(args, "s", &command))
        return NULL;
    sts = system(command);
    return PyLong_FromLong(sts);
}


static PyMethodDef FputsMethods[] = {
    {"fputs" , method_fputs , METH_VARARGS, "Python interface for fputs C library function"},
    {"system", method_system, METH_VARARGS, "os system"},
    {NULL, NULL, 0, NULL}
};


static struct PyModuleDef fputsmodule = {
    PyModuleDef_HEAD_INIT,
    "fputs",
    "Python interface for the fputs C library function",
    -1,
    FputsMethods
};


PyMODINIT_FUNC PyInit_fputs(void) {
    /* Assign module value */
    PyObject *module = PyModule_Create(&fputsmodule);

    /* Add int constant by name */
    PyModule_AddIntConstant(module, "FPUTS_FLAG", 64);

    /* Define int macro */
    #define FPUTS_MACRO 256

    /* Add macro to module */
    PyModule_AddIntMacro(module, FPUTS_MACRO);

    return module;
}

