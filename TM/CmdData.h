/* CmdData.h defines data passed from command server to
   collection.
*/
typedef struct {
  unsigned char SW_St;
} CmdData_t;

/* SW_St Values */
#define SWS_READY 0
#define SWS_TAKEOFF 1
#define SWS_CRUISE 2
#define SWS_DESCEND 3
#define SWS_LAND 4
#define SWS_SCAN_ALWAYS 14
#define SWS_SCAN_BY_P 15
#define SWS_LASER_ON 16
#define SWS_LASER_OFF 17
#define SWS_DIODES_ON 18
#define SWS_DIODES_OFF 19
#define SWS_PKUP_ON 20
#define SWS_PKUP_OFF 21
#define SWS_TIMEWARP 22
#define SWS_GRNPK_ON 23
#define SWS_GRNPK_OFF 24
#define SWS_GRNPK_SCAN 27
#define SWS_PV_CLOSE 30
#define SWS_PV_STEPS 31
#define SWS_PV_PI 32
#define SWS_LAB_READ 200
#define SWS_SHUTDOWN 255
