;; Auto-generated. Do not edit!


(when (boundp 'my_robot_msgs::HardwareStatus)
  (if (not (find-package "MY_ROBOT_MSGS"))
    (make-package "MY_ROBOT_MSGS"))
  (shadow 'HardwareStatus (find-package "MY_ROBOT_MSGS")))
(unless (find-package "MY_ROBOT_MSGS::HARDWARESTATUS")
  (make-package "MY_ROBOT_MSGS::HARDWARESTATUS"))

(in-package "ROS")
;;//! \htmlinclude HardwareStatus.msg.html


(defclass my_robot_msgs::HardwareStatus
  :super ros::object
  :slots (_temperature _are_motors_up _debug_msg ))

(defmethod my_robot_msgs::HardwareStatus
  (:init
   (&key
    ((:temperature __temperature) 0)
    ((:are_motors_up __are_motors_up) nil)
    ((:debug_msg __debug_msg) "")
    )
   (send-super :init)
   (setq _temperature (round __temperature))
   (setq _are_motors_up __are_motors_up)
   (setq _debug_msg (string __debug_msg))
   self)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:are_motors_up
   (&optional (__are_motors_up :null))
   (if (not (eq __are_motors_up :null)) (setq _are_motors_up __are_motors_up)) _are_motors_up)
  (:debug_msg
   (&optional __debug_msg)
   (if __debug_msg (setq _debug_msg __debug_msg)) _debug_msg)
  (:serialization-length
   ()
   (+
    ;; int64 _temperature
    8
    ;; bool _are_motors_up
    1
    ;; string _debug_msg
    4 (length _debug_msg)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _temperature
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _temperature (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _temperature) (= (length (_temperature . bv)) 2)) ;; bignum
              (write-long (ash (elt (_temperature . bv) 0) 0) s)
              (write-long (ash (elt (_temperature . bv) 1) -1) s))
             ((and (class _temperature) (= (length (_temperature . bv)) 1)) ;; big1
              (write-long (elt (_temperature . bv) 0) s)
              (write-long (if (>= _temperature 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _temperature s)(write-long (if (>= _temperature 0) 0 #xffffffff) s)))
     ;; bool _are_motors_up
       (if _are_motors_up (write-byte -1 s) (write-byte 0 s))
     ;; string _debug_msg
       (write-long (length _debug_msg) s) (princ _debug_msg s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _temperature
#+(or :alpha :irix6 :x86_64)
      (setf _temperature (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _temperature (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; bool _are_motors_up
     (setq _are_motors_up (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _debug_msg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _debug_msg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get my_robot_msgs::HardwareStatus :md5sum-) "16c9db7011617520b4a5c142182c234c")
(setf (get my_robot_msgs::HardwareStatus :datatype-) "my_robot_msgs/HardwareStatus")
(setf (get my_robot_msgs::HardwareStatus :definition-)
      "int64 temperature
bool are_motors_up
string debug_msg
")



(provide :my_robot_msgs/HardwareStatus "16c9db7011617520b4a5c142182c234c")


