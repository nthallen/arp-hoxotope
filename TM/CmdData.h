/* CmdData.h defines data passed from command server to
   collection.
*/
typedef struct {
  unsigned char SW_St;
} CmdData_t;

/* SW_St Values */
#define SWS_READY 0
#define SWS_PKUP_ON 20
#define SWS_PKUP_OFF 21
#define SWS_PV_CLOSE 30
#define SWS_PV_STEPS 31
#define SWS_PV_PI 32
#define SWS_LAB_READ 200
#define SWS_SHUTDOWN 255
