/* CmdData.h defines data passed from command server to
   collection.
*/
typedef struct {
  unsigned char SW_St;
} CmdData_t;

#define SWS_READY 0
#define SWS_PKUP_ON 20
#define SWS_PKUP_OFF 21
