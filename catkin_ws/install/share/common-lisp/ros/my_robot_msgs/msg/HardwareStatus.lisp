; Auto-generated. Do not edit!


(cl:in-package my_robot_msgs-msg)


;//! \htmlinclude HardwareStatus.msg.html

(cl:defclass <HardwareStatus> (roslisp-msg-protocol:ros-message)
  ((temperature
    :reader temperature
    :initarg :temperature
    :type cl:integer
    :initform 0)
   (are_motors_up
    :reader are_motors_up
    :initarg :are_motors_up
    :type cl:boolean
    :initform cl:nil)
   (debug_msg
    :reader debug_msg
    :initarg :debug_msg
    :type cl:string
    :initform ""))
)

(cl:defclass HardwareStatus (<HardwareStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HardwareStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HardwareStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_robot_msgs-msg:<HardwareStatus> is deprecated: use my_robot_msgs-msg:HardwareStatus instead.")))

(cl:ensure-generic-function 'temperature-val :lambda-list '(m))
(cl:defmethod temperature-val ((m <HardwareStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_robot_msgs-msg:temperature-val is deprecated.  Use my_robot_msgs-msg:temperature instead.")
  (temperature m))

(cl:ensure-generic-function 'are_motors_up-val :lambda-list '(m))
(cl:defmethod are_motors_up-val ((m <HardwareStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_robot_msgs-msg:are_motors_up-val is deprecated.  Use my_robot_msgs-msg:are_motors_up instead.")
  (are_motors_up m))

(cl:ensure-generic-function 'debug_msg-val :lambda-list '(m))
(cl:defmethod debug_msg-val ((m <HardwareStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_robot_msgs-msg:debug_msg-val is deprecated.  Use my_robot_msgs-msg:debug_msg instead.")
  (debug_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HardwareStatus>) ostream)
  "Serializes a message object of type '<HardwareStatus>"
  (cl:let* ((signed (cl:slot-value msg 'temperature)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'are_motors_up) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'debug_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'debug_msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HardwareStatus>) istream)
  "Deserializes a message object of type '<HardwareStatus>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'temperature) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:setf (cl:slot-value msg 'are_motors_up) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'debug_msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'debug_msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HardwareStatus>)))
  "Returns string type for a message object of type '<HardwareStatus>"
  "my_robot_msgs/HardwareStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HardwareStatus)))
  "Returns string type for a message object of type 'HardwareStatus"
  "my_robot_msgs/HardwareStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HardwareStatus>)))
  "Returns md5sum for a message object of type '<HardwareStatus>"
  "16c9db7011617520b4a5c142182c234c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HardwareStatus)))
  "Returns md5sum for a message object of type 'HardwareStatus"
  "16c9db7011617520b4a5c142182c234c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HardwareStatus>)))
  "Returns full string definition for message of type '<HardwareStatus>"
  (cl:format cl:nil "int64 temperature~%bool are_motors_up~%string debug_msg~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HardwareStatus)))
  "Returns full string definition for message of type 'HardwareStatus"
  (cl:format cl:nil "int64 temperature~%bool are_motors_up~%string debug_msg~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HardwareStatus>))
  (cl:+ 0
     8
     1
     4 (cl:length (cl:slot-value msg 'debug_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HardwareStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'HardwareStatus
    (cl:cons ':temperature (temperature msg))
    (cl:cons ':are_motors_up (are_motors_up msg))
    (cl:cons ':debug_msg (debug_msg msg))
))
