import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import accountaddbutton from '@salesforce/apex/accountHome.accountaddbutton';

export default class DeleteAccount extends LightningElement {
    nameValue;

    handleChange(event){
        const eventName = event.target.name;

        if(eventName === 'name'){
            this.nameValue = event.target.value;
        }
    }

    handleDelete(){
        accountaddbutton({accountName : this.nameValue})
        .then(data => { 
            this.dispatchEvent(new ShowToastEvent({
                title: 'Success',
                message: data + ' Account Deleted Successfully',
                variant: 'success'
            }));

           window.location.reload();
        }).catch(error => {
            this.dispatchEvent(new ShowToastEvent({
                title: 'Error',
                message: error.body.message,
                variant: 'error'
            }));
        })
    }

    handleClose(){
        window.location.reload();
    }
    // handleDelete(){
    //     this.dispatchEvent(new ShowToastEvent({
    //         title: 'Record Delete Successfully',
    //         variant: 'success'
    //     }));
    //     window.location.reload();
    // }
}