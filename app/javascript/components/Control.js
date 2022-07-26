import { useEffect } from "react";

import React from 'react';

function Control ({ control }) {

  return(
    <button
      style={{
        border: 'none',
        opacity: 0.7,
        height: 300,
        width: 300,
        position: 'relative',
        float: 'right',
        right: '500px',
        bottom: '560px',
        transition: '0.5s',
        borderRadius: '50%'
      }}>
      <img style={{width: 280}} src={control.avatar.url} />
      <span>{control?.name}</span>
    </button>
  )
}

export default Control;