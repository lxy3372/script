#!/bin/sh

export PATH=/usr/bin:/bin:/usr/local/bin:/usr/X11R6/bin;
export LANG=zh_CN.GB2312;

function usage()
{
	   echo "$0 filelog  options";
	      exit 1;

	  }

	  function slowlog()
	  {
		  #set -x;
	  field=$2;
	  files=$1;
	  end=2;
	  msg="";

	  [[ $2 == '1' ]] && field=1&&end=2&&msg="总访问次数统计";
	  [[ $2 == '2' ]] && field=3&&end=4&&msg="平均访问时间统计";

	  echo -e "\r\n\r\n";
	  echo -n "$msg";
	  seq -s '#' 30 | sed -e 's/[0-9]*//g';

	  awk '{split($7,bbb,"?");arr[bbb[1]]=arr[bbb[1]]+$NF; arr2[bbb[1]]=arr2[bbb[1]]+1; 
  } END{for ( i in arr ) { print i":"arr2[i]":"arr[i]":"arr[i]/arr2[i]
  }
  }' $1 | sort  -t: +$field -$end -rn |grep "pages" |head -30 | sed 's/:/\t/g'

  }

  [[ $# < 2 ]] && usage;

  slowlog $1 $2;
