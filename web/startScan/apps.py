from django.apps import AppConfig
<<<<<<< HEAD
from reNgine.definitions import logger
=======

from ajta.definitions import logger
>>>>>>> ba258ee7 (init ajta)


class StartscanConfig(AppConfig):
    name = 'startScan'

    def ready(self):
        '''
        Any Scans that were incomplete in the last scan, we will mark them failed after
        server restarted
        This does not include pending_scans, pending_scans are taken care by celery
        '''
        pass
        # logger.info('Cancelling all the ongoing scans')
        # ScanHistory = self.get_model('ScanHistory')
        # ScanHistory.objects.filter(scan_status=1).update(scan_status=0)
